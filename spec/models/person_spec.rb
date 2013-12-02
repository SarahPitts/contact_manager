require 'spec_helper'

describe Person do
  let(:person) { Person.new(first_name: "John", last_name: "Doe")}

  it "should be valid" do
    expect(person).to be_valid
  end

  it "should not be valid without a first name" do
    person.first_name = nil
    expect(person).to_not be_valid
  end

  it "should not be valid without a last name" do
    person.last_name = nil
    expect(person).to_not be_valid
  end

  it 'responds with its created phone numbers' do
    person.phone_numbers.build(number: '555-8888')
    expect(person.phone_numbers.map(&:number)).to eq(['555-8888'])
  end

  it 'responds with its created email addresses' do
    person.email_addresses.build(address: 'me@example.com')
    expect(person.email_addresses.map(&:address)).to eq(['me@example.com'])
  end
end