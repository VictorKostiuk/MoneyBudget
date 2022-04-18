# frozen_string_literal: true

class RemoveForeignKeyFromTransaction < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :category_id
  end
end
