class AnswersController < ApplicationController
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[show edit update destroy]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    answer = @question.answers.new(answer_params)

    if answer.save
      redirect_to answer
    else
      redirect_to action: :new
    end
  end

  def update
    if @answer.update_attributes(answer_params)
      redirect_to @answer
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to action: :index
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
