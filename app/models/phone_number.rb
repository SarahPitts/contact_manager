class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :person_id
  belongs_to :person
  belongs_to :company

  validates :number, :person_id, presence: true
end