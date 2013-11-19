require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.phone_numbers.create(number: "555-1234")
    person.phone_numbers.create(number: "555-5678")
    visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it 'has a link to add a new phone number' do
    expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
  end

  it 'adds a new phone number' do
    #
  end

  it 'has links to edit phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('edit', href: edit_phone_number_path(phone))
    end
  end

  it 'edits a phone number' do
    phone = person.phone_numbers.first
    old_number = phone.number

    first(:link, 'edit').click
    page.fill_in('Number', with: '555-9191')
    page.click_button('Update Phone number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('555-9191')
    expect(page).to_not have_content(old_number)
  end

  it 'has links to delete phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('delete')
    end
  end
end

describe "email addresses" do

let(:person) { Person.create(first_name: 'Jane', last_name: 'Doe') }

    before(:each) do
      person.email_addresses.create(address: "add3@example.com")
      person.email_addresses.create(address: "add4@example.com")
      visit person_path(person)
    end

    it 'has list items for each email address' do
      person.email_addresses.each do |email_address|
        expect(page).to have_selector('li', text: email_address.address)
      end
    end

    it 'has has an add email address link' do
      person.email_addresses.each do |email_address|
        expect(page).to have_link('Add email address', href: new_email_address_path(person_id: person.id))
      end
    end

    it 'adds a new email_address' do
      page.click_link("Add email address")
      page.fill_in('Address', with: "addedemail@example.com")
      page.fill_in('email_address_person_id', with: "1")
      page.click_button("Create Email address")
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('addedemail@example.com')
    end
end
