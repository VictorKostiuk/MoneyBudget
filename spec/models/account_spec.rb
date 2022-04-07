# frozen_string_literal: true

RSpec.describe Account, type: :model do
  it { is_expected.to have_many :transactions }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :for_what }
end
