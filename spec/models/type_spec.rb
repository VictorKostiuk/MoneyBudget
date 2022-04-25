# frozen_string_literal: true

RSpec.describe Type, type: :model do
  it { is_expected.to have_many :transactions }
  it { is_expected.to validate_presence_of :name }
end
