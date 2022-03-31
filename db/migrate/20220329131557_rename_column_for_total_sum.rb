class RenameColumnForTotalSum < ActiveRecord::Migration[7.0]
  def change
    rename_column :total_sums, :count, :total_count
  end
end
