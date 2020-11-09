class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    self.doctors.count
  end

  def doctor_university
    doctors.select(:university).distinct.pluck(:university)
  end
end
