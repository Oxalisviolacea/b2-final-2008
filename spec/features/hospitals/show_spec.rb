require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a hospitals's show page" do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital_id: @hospital_1.id)
      @doctor_3 = Doctor.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University', hospital_id: @hospital_1.id)
      @doctor_4 = Doctor.create!(name: 'Duplicate University Doctor', specialty: 'Attending Surgeon', university: 'Stanford University', hospital_id: @hospital_1.id)
    end

    it "I see the hopital's name, doctors, and universities the doctors attended" do
      visit "hospitals/#{@hospital_1.id}"

      expect(page).to have_content(@hospital_1.name)

      expect(page).to have_content('Employs 4 doctors')

      expect(page).to have_content(@doctor_1.university)
      expect(page).to have_content(@doctor_2.university)
      # universities should only appear once
      expect(page).to have_content(@doctor_3.university, count: 1)
    end
  end
end