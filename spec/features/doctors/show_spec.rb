require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a doctor's show page" do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital_id: @hospital_1.id)
      @patient_1 = @doctor_1.patients.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = @doctor_1.patients.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = @doctor_2.patients.create!(name: 'Rebecca Pope', age: 32)
    end

    it "I see all of that doctor's information, hospital they work for, and names of patients" do
      visit "/doctors/#{@doctor_1.id}"

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)
      expect(page).to have_content(@hospital_1.name)

      expect(page).to_not have_content(@patient_3.name)

      within("#patient-#{@patient_1.id}") do
        expect(page).to have_content(@patient_1.name)
      end

      within("#patient-#{@patient_2.id}") do
        expect(page).to have_content(@patient_2.name)
      end
    end

    it 'I can remove a relationship between doctor and patient' do
      visit "/doctors/#{@doctor_1.id}"

      within("#patient-#{@patient_1.id}") do
        click_button 'Remove Patient'
      end
    
      expect(current_path).to eq("/doctors/#{@doctor_1.id}")

      # the patient should still exist
      Patient.find(@patient_1.id)
    end
  end
end