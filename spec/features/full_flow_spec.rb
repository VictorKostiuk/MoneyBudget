# frozen_string_literal: true

RSpec.describe 'Full flow', driver: :selenium_chrome do

  it 'Successfully sign up' do
    sign_up

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_current_path root_path, ignore_query: true
  end

  it 'Registered user to sign in' do
    email = Faker::Internet.unique.email
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    click_on 'Sign out'

    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: '12345678'
    click_on 'Log in', class: 'btn btn-dark'

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_current_path root_path, ignore_query: true
  end

  it 'User signed out' do
    sign_up

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_current_path root_path, ignore_query: true

    click_on 'Sign out'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  it 'Registered user try create account' do
    sign_up
    create_account

    expect(page).to have_content 'You are being redirected.'
  end

  it 'Registered user creates category' do
    sign_up
    visit categories_path
    click_on 'New category'
    create_category
    visit categories_path

    expect(page).to have_content 'test1'
  end

  it 'Registered user creates type' do
    sign_up
    visit new_type_path
    create_type

    expect(page).to have_content 'You are being redirected.'
    expect change(Type, :count).by(+1)
  end

  it 'Registered user try create transaction' do
    sign_up
    visit accounts_path
    create_account
    click_on 'redirected'
    click_on 'test', match: :first
    click_on 'New Category'
    create_category
    click_on 'redirected'
    visit new_type_path
    create_type
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
