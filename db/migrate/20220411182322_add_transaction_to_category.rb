# frozen_string_literal: true

class AddTransactionToCategory < ActiveRecord::Migration[7.0]
  def change
    change_table :transactions do |t|
      t.belongs_to :category, foreign_key: true
    end
  end
end
