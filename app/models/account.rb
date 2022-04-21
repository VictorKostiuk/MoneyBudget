# frozen_string_literal: true

class Account < ApplicationRecord
  validates :title, presence: true
  validates :for_what, presence: true
  has_many :transactions, dependent: :destroy
  belongs_to :user
end
