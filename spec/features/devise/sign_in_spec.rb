# frozen_string_literal: true

RSpec.describe 'User sign in' do
  let(:user) { FactoryBot.create(:user) }

  it 'Registered user try to sign in' do
    log_in(user)

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_current_path root_path, ignore_query: true
  end

  it 'Non-registered user try to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
    expect(page).to have_current_path new_user_session_path, ignore_query: true
  end
end
