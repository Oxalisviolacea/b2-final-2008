Rails.application.routes.draw do
  get '/doctors/:doctor_id', to: 'doctors#show'
  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctors#destroy_patient'

  get '/hospitals/:hospital_id', to: 'hospitals#show'
end
