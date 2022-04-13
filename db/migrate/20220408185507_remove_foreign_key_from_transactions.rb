# frozen_string_literal: true

class RemoveForeignKeyFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :categories_id
  end
end
