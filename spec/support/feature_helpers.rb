# frozen_string_literal: true

module FeatureHelpers
  def log_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in', class: 'btn btn-dark'
  end

  def sign_up
    visit new_user_registration_path
    fill_in 'Email', with: Faker::Internet.unique.email
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
  end

  def create_account
    click_on 'New Account'
    fill_in 'Title', with: 'test'
    fill_in 'For what', with: 'test1'
    click_on 'Create Account'
  end

  def create_transaction
    click_on 'New Transaction'
    fill_in 'Title', with: 'test'
    fill_in 'Body', with: 'test1'
    fill_in 'Cost', with: 12
    click_on 'Create Transaction'
  end

  def create_type
    fill_in 'Name', with: Faker::Name.name
    click_on 'Create Type'
  end

  def create_category
    fill_in 'Name', with: 'test1'
    fill_in 'Description', with: 'About that'
    click_on 'Create Category'

    sleep 1
    expect change(Category, :count).by(+1)
  end
end
