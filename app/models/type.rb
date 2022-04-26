# frozen_string_literal: true

class Type < ApplicationRecord
  has_many :transactions
  validates :name, presence: true
end
