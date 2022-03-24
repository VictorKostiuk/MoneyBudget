# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Check, type: :model do
  it { is_expected.to belong_to :total_sum }
  it { is_expected.to validate_presence_of :body }
end
