# frozen_string_literal: true

module FeatureHelpers
  def log_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    within("body") do
      click_link "Log in"
    end
  end

  def sign_up
    visit new_user_registration_path
    fill_in 'Email', with: Faker::Internet.unique.email
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
  end

  def create_account
    click_on 'New Total Sum'
    fill_in 'Title', with: 'test'
    fill_in 'For what', with: 'test1'
    fill_in 'Count', with: 12
    click_on 'Create Total sum'
  end

  def create_transaction
    fill_in 'Title', with: 'test'
    fill_in 'Body', with: 'test1'
    fill_in 'Cost', with: 12
    click_on 'Create Transaction'
  end
end
