class SetDeafoltForTotalSum < ActiveRecord::Migration[7.0]
  def self.up
    change_column :total_sums, :count, :integer, :default => 0
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
