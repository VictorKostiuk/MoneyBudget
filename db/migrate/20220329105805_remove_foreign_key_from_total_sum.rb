class RemoveForeignKeyFromTotalSum < ActiveRecord::Migration[7.0]
  def change
    remove_belongs_to :total_sums, :checks
  end
end
