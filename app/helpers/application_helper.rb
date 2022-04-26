# frozen_string_literal: true

module ApplicationHelper

  def type_of_transaction(transaction)
    case
      when transaction.type.name == 'income'
        "table-success"
      when transaction.type.name == 'expense'
        "table-warning"
      when transaction.type.name == 'lend'
        "table-danger"
      when transaction.type.name == 'loan'
        "table-info"
    end
  end
end
