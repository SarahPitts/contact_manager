require 'spec_helper'

describe Person do
  it 'is invalid without a last name' do
    person = Person.new(first_name: 'Bob', last_name: nil)
    expect(person).not_to be_valid
  end
end

class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name, :last_name, presence: true
end

