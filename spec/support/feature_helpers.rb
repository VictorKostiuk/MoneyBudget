# frozen_string_literal: true

module FeatureHelpers
  def log_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def sign_up
    visit new_user_registration_path
    fill_in 'Email', with: Faker::Internet.unique.email
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
  end

  def create_total_sum
    click_on 'New Total Sum'
    fill_in 'Title', with: 'test'
    fill_in 'For what', with: 'test1'
    fill_in 'Count', with: 12
    click_on 'Create Total sum'
  end

  def create_check
    fill_in 'Title', with: 'test'
    fill_in 'Body', with: 'test1'
    fill_in 'Cost', with: 12
    click_on 'Create Check'
  end

  def check(user, total_sum)
    log_in(user)
    visit total_sum_path(total_sum)
    create_check
    click_on 'redirected'
  end
end
