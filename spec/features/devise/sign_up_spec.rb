# frozen_string_literal: true

RSpec.describe 'User sign up' do
  let(:user) { create(:user) }

  it 'Successfully sign up' do
    sign_up

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_current_path root_path, ignore_query: true
  end

  it 'Not successful sign up' do
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    expect(page).to have_content 'Email has already been taken'
    expect(page).to have_current_path user_registration_path, ignore_query: true
  end
end
