# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :account
  validates :body, presence: true
  has_one_attached :image, dependent: :destroy
  has_one :category
end
