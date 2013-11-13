require 'spec_helper'

describe EmailAddress do
  let(:email_address) { EmailAddress.new(address: "joe@gmail.com") }


  it 'is valid' do
    expect(email_address).to be_valid
  end
end
