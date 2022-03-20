require 'rails_helper'

RSpec.feature 'User sign out' do

  let(:user) { FactoryBot.create(:user) }

  scenario 'User signed out' do

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully'
    expect(current_path).to eq root_path

    click_on "Sign out"

    expect(page).to have_content 'Signed out successfully.'
    expect(current_path).to eq root_path
  end
end