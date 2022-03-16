FactoryBot.define do
  factory :total_sum do
    title { 'default' }
    for_what { 'for_that' }
    count { 123 }
    check_ids { FactoryBot.create(:check) }
  end
end
