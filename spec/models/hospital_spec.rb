require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    before :each do
      @hospital_1 = Hospital.create!(name: 'Denver Health')
      @doctor_1 = Doctor.create!(name: 'Alex', specialty: 'Emergency Medicine', university: 'Seattle State', hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: 'Hanna', specialty: 'Pediatrics', university: 'Western Colorado State', hospital_id: @hospital_1.id)
      @doctor_3 = Doctor.create!(name: 'Kat', specialty: 'Pharmacist', university: 'Western Colorado State', hospital_id: @hospital_1.id)
    end

    it '.doctor_count' do
      expect(@hospital_1.doctor_count).to eq(3)
    end

    it '.doctor_university' do
      expect(@hospital_1.doctor_university).to eq(["Seattle State", "Western Colorado State"])
    end
  end
end
