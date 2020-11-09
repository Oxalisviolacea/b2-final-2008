require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit the patient's index page" do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Denver Health')
      @doctor_1 = Doctor.create!(name: 'Alex', specialty: 'Emergency Medicine', university: 'Seattle State', hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: 'Hanna', specialty: 'Pediatrics', university: 'Western Colorado State', hospital_id: @hospital_1.id)
      @patient_1 = @doctor_1.patients.create!(name: 'Tim', age: 50)
      @patient_2 = @doctor_1.patients.create!(name: 'Brian', age: 60)
      @patient_3 = @doctor_2.patients.create!(name: 'Meg', age: 60)
    end

    it 'I can see all of the patients listed oldes to youngest' do
      visit "/patients"
      expect("#{@patient_2.name}").to appear_before("#{@patient_3.name}")
      expect("#{@patient_3.name}").to appear_before("#{@patient_1.name}")
    end
  end
end