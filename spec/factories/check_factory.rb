# frozen_string_literal: true

FactoryBot.define do
  factory :check do
    title { 'default' }
    body { 'for_that' }
    cost { 123 }
  end
end
