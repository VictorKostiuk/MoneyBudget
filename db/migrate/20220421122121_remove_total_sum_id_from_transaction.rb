class RemoveTotalSumIdFromTransaction < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :total_sum_id
  end
end
