class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :pictures
end
