# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
