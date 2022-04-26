# frozen_string_literal: true

module ApplicationHelper

  def type_of_transaction(transaction)
    if transaction.type.name == 'income'
      "table-success"
    elsif transaction.type.name == 'expense'
      "table-warning"
    elsif transaction.type.name == 'lend'
      "table-danger"
    elsif transaction.type.name == 'loan'
      "table-info"
    else
    end
  end
end
