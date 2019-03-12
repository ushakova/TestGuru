class Test < ApplicationRecord
  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :category
  belongs_to :author, class_name: 'User'

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :categories_by_name, -> (name) { joins(:category).where(categories: { title: name }) }

  validates :title, presence: :true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  def self.test_by_category(category_title)
    categories_by_name(name).order(title: :desc).pluck(:title)
  end
end
