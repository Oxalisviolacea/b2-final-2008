require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit the patient's index page" do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital_id: @hospital_1.id)
      @patient_1 = @doctor_1.patients.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = @doctor_1.patients.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = @doctor_2.patients.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = @doctor_2.patients.create!(name: 'Zola Shepherd', age: 2)
    end

    it 'I can see all of the patients listed oldest to youngest' do
      visit "/patients"
      expect("#{@patient_2.name}").to appear_before("#{@patient_3.name}")
      expect("#{@patient_3.name}").to appear_before("#{@patient_1.name}")
      expect("#{@patient_1.name}").to appear_before("#{@patient_4.name}")
    end
  end
end