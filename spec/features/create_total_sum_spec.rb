# frozen_string_literal: true

RSpec.describe 'User creates a total_sum', driver: :selenium_chrome do
  let(:total_sum) { create(:total_sum) }

  it 'Registered user try create total_sum' do
    sign_up
    create_account

    expect(page).to have_content 'test'
  end

  it 'Non-registered user try create total_sum' do
    visit root_path

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
