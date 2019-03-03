class Test < ApplicationRecord
  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :category

  def self.test_by_category(category_title)
    joins(:category).where(categories: { title: category_title })
                    .order('tests.title DESC')
                    .pluck('tests.title')
  end
end
