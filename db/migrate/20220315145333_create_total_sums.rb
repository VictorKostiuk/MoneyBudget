class CreateTotalSums < ActiveRecord::Migration[7.0]
  def change
    create_table :total_sums do |t|
      t.belongs_to :checks, null: false, foreign_key: true
      t.string :title
      t.text :for_what
      t.integer :count

      t.timestamps
    end
  end
end
