# frozen_string_literal: true

RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to :account }
  it { is_expected.to belong_to :category }
  it { is_expected.to validate_presence_of :body }
end
