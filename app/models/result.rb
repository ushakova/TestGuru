# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question, on: %i[create update]

  SUCCESS_RATE = 85

  def accept!(answer_ids)
    self.score += 1 if correct_answer?(answer_ids)

    save!
  end

  def success?
    score * 100 / number_of_questions >= SUCCESS_RATE
  end

  def completed?
    current_question.nil?
  end

  def question_number
    test.questions.index(current_question) + 1
  end

  def number_of_questions
    test.questions.count
  end

  private

  def set_current_question
    current_question ? set_next_question : set_first_question
  end

  def set_first_question
    self.current_question = test.questions.first
  end

  def set_next_question
    self.current_question = test.questions
                                .order(:id)
                                .where(
                                  'id > :id',
                                  id: current_question.id
                                ).first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids
  end

  def correct_answers
    current_question.answers.correct
  end
end
