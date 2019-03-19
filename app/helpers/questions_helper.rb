# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "New question in '#{@test.title}' test"
    else
      "Edit question in '#{question.test.title}' test"
    end
  end
end
