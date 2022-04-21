class AddTransactionsToAccount < ActiveRecord::Migration[7.0]
  def change
    change_table :transactions do |t|
      t.belongs_to :account, foreign_key: true
    end
  end
end
