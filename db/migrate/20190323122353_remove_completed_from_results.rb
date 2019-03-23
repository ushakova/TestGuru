class RemoveCompletedFromResults < ActiveRecord::Migration[5.2]
  def change
    remove_column :results, :completed
  end
end
