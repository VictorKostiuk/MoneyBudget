# frozen_string_literal: true

RSpec.describe 'User creates a check', driver: :selenium_chrome do

  it 'Registered user try create check' do
    sign_up
    create_total_sum
    visit total_sums_path
    click_on 'Show'
    create_check
    click_on 'redirected'

    within '.checks' do
      expect(page).to have_content 'test'
      expect(page).to have_content 'test1'
    end
  end

  it 'Non-registered user try create check' do
    visit total_sums_path
    click_on 'Show'

    expect(page).not_to have_content 'New Check'
  end
end
