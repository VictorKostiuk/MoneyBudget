# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User creates a check' do
  let(:user) { FactoryBot.create(:user) }
  let(:total_sum) { FactoryBot.create(:total_sum) }

  it 'Registered user try create check' do
    check(user, total_sum)

    within '.checks' do
      expect(page).to have_content 'test'
      expect(page).to have_content 'test1'
    end
  end

  it 'Non-registered user try create check' do
    visit total_sum_path(total_sum)

    expect(page).not_to have_content 'New Check'
  end
end
