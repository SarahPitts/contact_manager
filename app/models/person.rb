class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :phone_numbers,  as: :contact
  has_many :email_addresses

  validates :first_name, :last_name, presence: true
end