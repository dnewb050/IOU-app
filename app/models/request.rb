class Request < ApplicationRecord
  validates :creditor, :debtor, :line_item_name, presence: true
  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0.01}

  belongs_to  :creditor,
              :class_name => 'User'
  belongs_to  :debtor,
              :class_name => 'User'
end
