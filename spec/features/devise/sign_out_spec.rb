# frozen_string_literal: true

RSpec.describe 'User sign out' do
  let(:user) { create(:user) }

  it 'User signed out' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in', class: 'btn btn-dark'

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_current_path root_path, ignore_query: true

    click_on 'Sign out'

    expect(page).to have_content 'Signed out successfully.'
    expect(page).to have_current_path root_path, ignore_query: true
  end
end
