# frozen_string_literal: true

RSpec.describe 'User creates a transaction', driver: :selenium_chrome do
  it 'Registered user try create transaction' do
    sign_up
    create_account
    visit accounts_path
    click_on 'test', match: :first
    click_on 'New Category'
    create_category
    visit new_type_path
    create_type
    visit accounts_path
    click_on 'test', match: :first
    create_transaction

    within '.transactions' do
      expect(page).to have_content 'test'
      expect(page).to have_content 'test1'
    end
  end

  it 'Non-registered user try create transaction' do
    visit accounts_path

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
