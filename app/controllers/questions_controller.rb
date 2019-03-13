# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new; end

  def create
    question = Question.new(test_id: params[:test_id],
                            body: question_params[:body])
    if question.save
      redirect_to action: :index
    else
      redirect_to action: :new
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
