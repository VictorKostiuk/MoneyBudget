# frozen_string_literal: true

class AddCategoryToTotalSum < ActiveRecord::Migration[7.0]
  def change
    add_reference :checks, :category
  end
end
