class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :person_id

  validates :number, :person_id, presence: true
end