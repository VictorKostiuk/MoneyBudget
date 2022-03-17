# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TotalSum, type: :model do
  it { should have_many :checks }
  it { should validate_presence_of :title }
end
