# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning Database..."
Appointment.destroy_all
Child.destroy_all
User.destroy_all
puts "Database cleaned..."

puts "Creating users..."
anna = User.create!(email: 'anna@lewagon.fr', password: 'anna123')
aaron = User.create!(email: 'aaron@lewagon.fr', password: 'aaron123')
puts "#{User.count} users created!"

# puts 'Creating 2 cooparents...'
# 2.times do
#   User.create!(
#     email: Faker::Company.name,
#     password: Faker::Alphanumeric.alpha(number: 10)
#   )
# end

puts "Now creating children..."

gabriel = Child.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 0, max_age: 12),
    birth_place: "Paris",
    school: Faker::Educator.primary_school,
    first_parent_id: anna.id,
    second_parent_id: aaron.id
  )

jade = Child.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  birth_date: Faker::Date.birthday(min_age: 0, max_age: 12),
  birth_place: "Paris",
  school: Faker::Educator.primary_school,
  first_parent_id: anna.id,
  second_parent_id: aaron.id
)

puts "...and appointments..."
foot_appointment = Appointment.create!(
  title: "Match de foot",
  date: Date.new(2024,03,24),
  start_time: DateTime.strptime("03/24/2024 10:00", "%m/%d/%Y %H:%M"),
  end_time: DateTime.strptime("03/24/2024 12:00", "%m/%d/%Y %H:%M"),
  category: "Football",
  address: "261 Boulevard de Tournai, 59650 Villeneuve d'Ascq",
  appointment_creator_id: anna.id,
  parent_in_charge_id: aaron.id,
  user_id: anna.id,
  child_id: gabriel.id,
  details: "Match de foot avec Paul en entraîneur (groupe 2B). Ne pas oublier le sac avec la tenue, les crampons, serviette et gourde!",
  )

puts '...Finished!'
