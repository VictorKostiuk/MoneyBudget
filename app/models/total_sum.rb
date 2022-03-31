# frozen_string_literal: true

class TotalSum < ApplicationRecord
  validates :title, presence: true
  validates :for_what, presence: true
  has_many :checks, dependent: :destroy
end
