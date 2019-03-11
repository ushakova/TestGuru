class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :body, presence: :true
  validate :validate_question_answers_number

  private

  def validate_question_answers_number
     errors.add(:answers, 'Too many answers') if question.answers.count >= 4
  end
end
