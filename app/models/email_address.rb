class EmailAddress < ActiveRecord::Base
  attr_accessible :address, :person_id
end
