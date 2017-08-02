class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  has_many  :creditor_requests,
            :class_name => 'Request',
            :foreign_key => 'creditor_id'
  has_many  :debtor_requests,
            :class_name => 'Request',
            :foreign_key => 'debtor_id'
end
