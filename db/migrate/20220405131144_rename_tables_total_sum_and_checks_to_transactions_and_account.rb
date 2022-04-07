# frozen_string_literal: true

class RenameTablesTotalSumAndChecksToTransactionsAndAccount < ActiveRecord::Migration[7.0]
  def change
    rename_table :total_sums, :accounts
    rename_table :checks, :transactions
  end
end
