# frozen_string_literal: true

FactoryBot.define do
  factory :type do
    name { Faker::Name.name }
  end
end
