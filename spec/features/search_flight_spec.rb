require 'rails_helper'

RSpec.describe 'Searching for a flight', type: :feature do
  let!(:toronto) { FactoryBot.create(:airport, code: 'YYZ', city: 'Toronto') }
  let!(:london) { FactoryBot.create(:airport, code: 'LGW', city: 'London') }
  let!(:flight1) { 
                  FactoryBot.create(:flight, departure_airport: toronto, 
                                    arrival_airport: london)
                 }

  before do
    visit root_path
    expect(page).to have_css 'h3', text: 'From'
    page.select 'Toronto', from: 'departure_airport_id'
    page.select 'London', from: 'arrival_airport_id'
    page.select '2', from: 'passengers'
    tomorrow = ((Date.today) + 1).strftime("%m/%d/%Y")
    puts flight1.departure_time
    page.select tomorrow, from: 'departure_time'
    click_on 'Search'
  end

  context 'when searching for a flight' do
    it 'finds 1 available flight' do
      expect(page).to have_content('1 Flight Found')
    end
  end

  context 'when booking a flight' do
    before do
      choose("Toronto to London - #{((Date.today) + 1).strftime("%m/%d/%Y %I:%M %P")}")
      click_on 'Book'
    end

    it 'has 2 passenger creation forms' do
      expect(page).to have_content 'Passenger 2 Info'
    end

    it 'does not have more than 2 passenger creation forms' do
      expect(page).not_to have_content 'Passenger 3 Info'
    end

    it 'is able to book the flight' do
      fill_in 'booking_passengers_attributes_0_name', with: Faker::Name.name
      fill_in 'booking_passengers_attributes_0_email', with: Faker::Internet.email
      fill_in 'booking_passengers_attributes_1_name', with: Faker::Name.name
      fill_in 'booking_passengers_attributes_1_email', with: Faker::Internet.email
      click_on 'Book'
      expect(page).to have_content('Flight Info')
    end
  end
end
