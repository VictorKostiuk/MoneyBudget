# frozen_string_literal: true

class TotalSum < ApplicationRecord
  validates :title, presence: true
  has_many :checks
end
