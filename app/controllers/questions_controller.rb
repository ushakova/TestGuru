# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = @test.question.new
  end

  def edit; end

  def create
    question = @test.questions.new(body: question_params[:body])

    if question.save
      redirect_to question
    else
      redirect_to action: :new
    end
  end

  def update
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to action: :index
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
