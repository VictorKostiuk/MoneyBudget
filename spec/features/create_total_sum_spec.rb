# frozen_string_literal: true

RSpec.describe 'User creates a total_sum' do
  let(:user) { FactoryBot.create(:user) }
  let(:total_sum) { FactoryBot.create(:total_sum) }

  it 'Registered user try create total_sum' do
    log_in(user)
    create_total_sum

    expect(page).to have_content 'You are being redirected.'
  end

  it 'Non-registered user try create total_sum' do
    visit root_path
    expect(page).not_to have_content 'New Total Sum'
  end
end
