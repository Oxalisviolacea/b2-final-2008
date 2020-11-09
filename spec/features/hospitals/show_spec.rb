require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a hospitals's show page" do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Denver Health')
      @doctor_1 = Doctor.create!(name: 'Alex', specialty: 'Emergency Medicine', university: 'Seattle State', hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: 'Hanna', specialty: 'Pediatrics', university: 'Western Colorado State', hospital_id: @hospital_1.id)
      @doctor_3 = Doctor.create!(name: 'Kat', specialty: 'Pharmacist', university: 'Western Colorado State', hospital_id: @hospital_1.id)
    end

    it "I see the hopital's name, doctors, and universities the doctors attended" do
      visit "hospitals/#{@hospital_1.id}"

      expect(page).to have_content(@hospital_1.name)

      expect(page).to have_content('Employs 3 doctors')

      expect(page).to have_content(@doctor_1.university)
      expect(page).to have_content(@doctor_2.university)
    end
  end
end