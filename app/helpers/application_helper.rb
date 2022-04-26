# frozen_string_literal: true

module ApplicationHelper

  def type_of_transaction(transaction)
    case transaction.type.name
      when 'income'
        "table-success"
      when 'expense'
        "table-warning"
      when 'lend'
        "table-danger"
      when 'loan'
        "table-info"
    end
  end
end
