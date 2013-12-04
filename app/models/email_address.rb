class EmailAddress < ActiveRecord::Base
  attr_accessible :address, :person_id

  belongs_to :person
  belongs_to :company

  validates_presence_of :address, :person_id
end
