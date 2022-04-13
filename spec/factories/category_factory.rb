# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { 'default' }
    description { 'About that' }
  end

  factory :invalid_category, class: 'Category' do
    name { nil }
    description { nil }
  end
end
