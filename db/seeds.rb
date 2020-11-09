# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital_id: @hospital_1.id)
      @doctor_3 = Doctor.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University', hospital_id: @hospital_1.id)
      @doctor_4 = Doctor.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvania', hospital_id: @hospital_1.id)
      @patient_1 = @doctor_1.patients.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = @doctor_1.patients.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = @doctor_2.patients.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = @doctor_2.patients.create!(name: 'Zola Shepherd', age: 2)