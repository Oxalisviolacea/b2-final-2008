require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    before :each do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital_id: @hospital_1.id)
      @doctor_3 = Doctor.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University', hospital_id: @hospital_1.id)
      @doctor_4 = Doctor.create!(name: 'Duplicate University Doctor', specialty: 'Attending Surgeon', university: 'Stanford University', hospital_id: @hospital_1.id)
    end

    it '.doctor_count' do
      expect(@hospital_1.doctor_count).to eq(4)
    end

    it '.doctor_university' do
      expect(@hospital_1.doctor_university).to eq(["Harvard University", "Johns Hopkins University", "Stanford University"])
    end
  end
end
