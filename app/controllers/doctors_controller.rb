class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:doctor_id])
  end

  def destroy_patient
    doctor = Doctor.find(params[:doctor_id])
    patient = doctor.patients.find(params[:patient_id])
    if patient
      doctor.patients.delete(patient)
    end
    redirect_to "/doctors/#{doctor.id}"
  end
end