class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: :true
  validate :number_of_answers

  private

  def number_of_answers
     errors.add(:answers, 'Too many answers') if question.answers.count >= 4
  end
end
