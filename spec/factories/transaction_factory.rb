# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    title { 'default' }
    body { 'for_that' }
    cost { 123 }
  end

  factory :invalid_transaction, class: 'Transaction' do
    title { nil }
    body { nil }
    cost { nil }
  end
end
