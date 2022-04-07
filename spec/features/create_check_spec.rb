# frozen_string_literal: true

RSpec.describe 'User creates a check', driver: :selenium_chrome do
  it 'Registered user try create check' do
    sign_up
    create_account
    visit accounts_path
    click_on 'Show'
    create_transaction
    click_on 'redirected'

    within '.transactions' do
      expect(page).to have_content 'test'
      expect(page).to have_content 'test1'
    end
  end

  it 'Non-registered user try create check' do
    visit accounts_path
    click_on 'Show'

    expect(page).not_to have_content 'New Transaction'
  end
end
