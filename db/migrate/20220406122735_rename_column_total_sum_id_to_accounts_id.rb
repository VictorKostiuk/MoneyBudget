# frozen_string_literal: true

class RenameColumnTotalSumIdToAccountsId < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :total_sum_id, :account_id
  end
end
