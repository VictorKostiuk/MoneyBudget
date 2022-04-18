# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  has_many :transactions
end
