# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hospital_1 = Hospital.create!(name: 'Denver Health')
@doctor_1 = Doctor.create!(name: 'Alex', specialty: 'Emergency Medicine', university: 'Seattle State', hospital_id: @hospital_1.id)
@doctor_2 = Doctor.create!(name: 'Hanna', specialty: 'Pediatrics', university: 'Western Colorado State', hospital_id: @hospital_1.id)
@doctor_2 = Doctor.create!(name: 'Kat', specialty: 'Pharmacist', university: 'Western Colorado State', hospital_id: @hospital_1.id)
@patient_1 = @doctor_1.patients.create!(name: 'Tim', age: 50)
@patient_2 = @doctor_1.patients.create!(name: 'Brian', age: 60)
@patient_3 = @doctor_2.patients.create!(name: 'Meg', age: 60)