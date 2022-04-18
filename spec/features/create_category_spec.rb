# frozen_string_literal: true

RSpec.describe 'User creates a category', driver: :selenium_chrome do
  it 'Registered user creates check' do
    sign_up
    create_account
    visit accounts_path
    click_on "test"
    click_on 'New Category'
    create_category
    visit categories_path

    expect(page).to have_content 'test1'
  end

  it 'Non-registered user try create check' do
    visit accounts_path
    click_on 'test'

    expect(page).not_to have_content 'New Category'
  end
end
