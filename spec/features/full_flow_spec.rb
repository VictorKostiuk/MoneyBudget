# frozen_string_literal: true

RSpec.describe 'Full flow', driver: :selenium_chrome do

  it 'creates everything' do
    email = Faker::Internet.unique.email
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_current_path root_path, ignore_query: true

    click_on 'Sign out'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'

    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: '12345678'
    click_on 'Log in', class: 'btn btn-dark'

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_current_path root_path, ignore_query: true

    create_account

    expect(page).to have_content 'You are being redirected.'

    visit categories_path
    click_on 'New category'
    create_category
    visit categories_path

    expect(page).to have_content 'test1'

    visit new_type_path
    create_type

    expect(page).to have_content 'You are being redirected.'
    expect change(Type, :count).by(+1)

    visit accounts_path
    click_on 'test', match: :first
    create_transaction
    click_on 'redirected'

    within '.transactions' do
      expect(page).to have_content 'test'
      expect(page).to have_content 'test1'
    end
  end
end
