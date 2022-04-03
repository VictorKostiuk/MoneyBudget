# frozen_string_literal: true

class Check < ApplicationRecord
  belongs_to :total_sum
  validates :body, presence: true
  has_one_attached :image, dependent: :destroy
end
