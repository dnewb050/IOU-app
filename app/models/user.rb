class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name,  presence: true, uniqueness: true
  has_secure_password
end
