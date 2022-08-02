class User < ApplicationRecord
  has_many :items, dependent: :destroy

  validates_presence_of :name, :email#, :password
  has_secure_password

  validates_uniqueness_of :email
end
