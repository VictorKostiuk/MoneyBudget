# frozen_string_literal: true

FactoryBot.define do
  factory :total_sum do
    title { 'default' }
    for_what { 'for_that' }
    count { 123 }
  end
end
