# frozen_string_literal: true

RSpec.describe 'User creates a category', driver: :selenium_chrome do
  it 'Registered user creates check' do
    sign_up
    visit categories_path
    click_on 'New category'
    create_category
    visit categories_path

    expect(page).to have_content 'test1'
  end

  it 'Non-registered user try create check' do
    visit accounts_path

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
