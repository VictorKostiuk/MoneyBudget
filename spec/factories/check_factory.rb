FactoryBot.define do
  factory :check do
    title { 'default' }
    body { 'for_that' }
    cost { 123 }
    total_sum { FactoryBot.create(:total_sum) }
  end
end
