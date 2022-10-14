require 'rails_helper'

RSpec.describe 'Searching for a flight', type: :feature do
  let!(:yyz) { FactoryBot.create(:airport, code: 'YYZ') }
  let!(:lgw) { FactoryBot.create(:airport, code: 'LGW') }
  let!(:flight1) { FactoryBot.create(:flight, departure_airport: yyz, arrival_airport: lgw) }

  before do
    visit root_path
    expect(page).to have_css 'h3', text: 'From'
    page.select 'YYZ', from: 'departure_airport_id'
    page.select 'LGW', from: 'arrival_airport_id'
    page.select '2', from: 'passengers'
    page.select '09/21/2022', from: 'departure_time'
    click_on 'Search'
  end

  context 'when searching for a flight' do
    it 'finds 1 available flight' do
      expect(page).to have_content('1 Flight Found')
    end
  end

  context 'when booking a flight' do
    before do
      choose('YYZ to LGW - 09/21/2022')
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
