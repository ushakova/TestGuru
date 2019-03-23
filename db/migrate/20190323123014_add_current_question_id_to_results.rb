class AddCurrentQuestionIdToResults < ActiveRecord::Migration[5.2]
  def change
    change_table :results do |t|
      t.references :current_question, foreign_key: { to_table: :questions }
    end
  end
end
