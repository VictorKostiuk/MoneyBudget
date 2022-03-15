class CreateChecks < ActiveRecord::Migration[7.0]
  def change
    create_table :checks do |t|
      t.belongs_to :total_sum, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.integer :cost

      t.timestamps
    end
  end
end
