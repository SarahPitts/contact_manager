require 'spec_helper'

describe EmailAddress do
  let(:email_address) {EmailAddress.new(address: "john@example.com", person_id: 1)}
  let(:person) { Person.new(first_name: 'John', last_name: 'Doe') }

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is not valid without an address' do
    email_address.address = nil
    expect(email_address).not_to be_valid
  end

  it 'is not valid without a person_id' do
    email_address.person_id = nil
    expect(email_address).not_to be_valid
  end
end
