# frozen_string_literal: true

RSpec.describe Category, type: :model do
  it { is_expected.to have_many :transactions }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }
end
