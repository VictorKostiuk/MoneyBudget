class AddAccountsAndTransactionsToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :accounts do |t|
      t.belongs_to :user, foreign_key: true
    end

    change_table :transactions do |t|
      t.belongs_to :user, foreign_key: true
    end
  end
end
