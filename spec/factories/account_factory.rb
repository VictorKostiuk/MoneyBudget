# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    title { 'default' }
    for_what { 'for_that' }
    total_count { 123 }
  end
  factory :invalid_account, class: 'Account' do
    title { nil }
    for_what { nil }
    total_count { nil }
  end
end
