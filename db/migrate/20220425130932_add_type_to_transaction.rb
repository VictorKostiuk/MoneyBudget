# frozen_string_literal: true

class AddTypeToTransaction < ActiveRecord::Migration[7.0]
  def change
    change_table :transactions do |t|
      t.belongs_to :type
    end
  end
end
