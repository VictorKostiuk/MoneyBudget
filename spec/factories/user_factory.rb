# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "user.#{n}@test.com"
    end
    password { '12345678' }
  end
end
