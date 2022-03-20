require "rails_helper"

RSpec.feature 'User sign up' do

  let(:user) { FactoryBot.create(:user) }

  scenario 'Successfully sign up' do

    sign_up

    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(current_path).to eq root_path
  end

  scenario 'Not successful sign up' do
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    expect(page).to have_content "Email has already been taken"
    expect(current_path).to eq user_registration_path
  end
end