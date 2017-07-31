class Request < ApplicationRecord
  validates :creditor, :debtor, :line_item_name, :amount, presence: true

  belongs_to  :creditor,
              :class_name => 'User'
  belongs_to  :debtor,
              :class_name => 'User'
end
