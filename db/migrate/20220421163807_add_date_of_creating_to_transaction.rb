class AddDateOfCreatingToTransaction < ActiveRecord::Migration[7.0]
  def change
    change_table :transactions do |t|
      t.datetime :date_of_creating, default: Time.now
    end
  end
end
