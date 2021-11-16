require 'rails_helper'

RSpec.describe 'Flights Index Page' do 
  describe 'When I visit the flights index page' do 
    before :each do 
      @lufthansa = Airline.create!(name: "Lufthansa") 
      @airfrance = Airline.create!(name: "Air France") 
      @indigo = Airline.create!(name: "Indigo") 

      @smooth = @lufthansa.flights.create!(number: "114", date: "11/17/21", departure_city: "Frankfurt", arrival_city: "NYC")
      @dangerous = @airfrance.flights.create!(number: "232", date: "11/18/21", departure_city: "Paris", arrival_city: "Pyongyang")
      @fun = @indigo.flights.create!(number: "455", date: "11/19/21", departure_city: "Mumbai", arrival_city: "Karachi")
      
      visit flights_path 
    end 
    it 'has a list of all flight numbers and ailrine names' do 
      expect(page).to have_content(@smooth.number)
      expect(page).to have_content(@dangerous.number)
      expect(page).to have_content(@fun.number)
      expect(page).to have_content(@lufthansa.name)

    end
  end
end