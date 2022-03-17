# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Check, type: :model do
  it { should belong_to :total_sum }
  it { should validate_presence_of :body }
end
