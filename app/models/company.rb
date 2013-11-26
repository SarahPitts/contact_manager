class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :phone_numbers

  validates :name, presence: true
end
