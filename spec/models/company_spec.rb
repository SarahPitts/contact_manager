require 'spec_helper'

describe Company do
	let(:company) { Company.new(name: "google") }


	it 'is valid' do
	expect(company).to be_valid
	end

	it 'is invalid without a name' do
	company.name = nil
	expect(company).to_not be_valid
	end

	it 'has an array of phone numbers' do
	expect(company.phone_numbers).to eq([])
	end
end