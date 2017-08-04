class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0.01}

  belongs_to :request
end
