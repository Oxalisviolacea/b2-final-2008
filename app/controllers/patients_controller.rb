class PatientsController < ApplicationController
  def index
    @patients = Patient.order(:name)
  end
end