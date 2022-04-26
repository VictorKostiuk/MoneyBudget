# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :account
  validates :body, presence: true
  has_one_attached :image, dependent: :destroy
  belongs_to :category
  belongs_to :user
  belongs_to :type
end
