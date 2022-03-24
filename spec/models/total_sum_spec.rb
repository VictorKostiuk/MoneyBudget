# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TotalSum, type: :model do
  it { is_expected.to have_many :checks }
  it { is_expected.to validate_presence_of :title }
end
