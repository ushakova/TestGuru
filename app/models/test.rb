class Test < ApplicationRecord
  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :category
  belongs_to :author, class_name: 'User'

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }

  def self.test_by_category(category_title)
    joins(:category).where(categories: { title: category_title })
                    .pluck('tests.title')
  end
end
