# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question'

  before_validation :set_current_question, on: [:create, :update]

  private

  def set_current_question
    current_question ? set_next_question : set_first_question
  end

  def set_first_question
    self.current_question = test.questions.first
  end

  def set_next_question
    self.current_question = test.questions.where(
      'id > :id', 
      id: current_question.id
    ).first
  end
end
