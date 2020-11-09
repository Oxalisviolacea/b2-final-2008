class Hospital < ApplicationRecord
  validates_presence_of :name
  has_many :doctors, dependent: :destroy

  def doctor_count
    self.doctors.count
  end

  def doctor_university
    doctors.select(:university).distinct.pluck(:university)
  end
end
