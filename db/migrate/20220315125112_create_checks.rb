# frozen_string_literal: true

class CreateChecks < ActiveRecord::Migration[7.0]
  def change
    create_table :checks do |t|
      t.string :title
      t.text :body
      t.integer :cost

      t.timestamps
    end
  end
end
