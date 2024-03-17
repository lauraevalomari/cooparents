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
Task.destroy_all
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
  date: Date.new(2024,03,12),
  start_time: DateTime.parse("12/03/2024 20:40"),
  end_time: DateTime.parse("12/03/2024 22:00"),
  category: "Activités",
  address: "261 Boulevard de Tournai, 59650 Villeneuve d'Ascq",
  appointment_creator_id: anna.id,
  parent_in_charge_id: aaron.id,
  user_id: anna.id,
  child_id: gabriel.id,
  details: "Match de foot avec Paul en entraîneur (groupe 2B). Ne pas oublier le sac avec la tenue, les crampons, serviette et gourde!",
  )

  dentist_appointment = Appointment.create!(
    title: "Dentist",
    date: Date.new(2024,03,12),
    start_time: DateTime.parse("13/03/2024 22:30"),
    end_time: DateTime.parse("13/03/2024 23:00"),
    category: "Santé",
    address: "4 Allée de la chambre, 33160 Bordeaux",
    appointment_creator_id: anna.id,
    parent_in_charge_id: aaron.id,
    user_id: anna.id,
    child_id: gabriel.id,
    details: "La prochaine fois tu te laveras les dents",
    )

    maths_appointment = Appointment.create!(
      title: "Maths Class",
      date: Date.new(2024,03,13),
      start_time: DateTime.parse("13/03/2024 17:30"),
      end_time: DateTime.parse("13/03/2024 19:00"),
      category: "Scolarité",
      address: "En Ligne",
      appointment_creator_id: anna.id,
      parent_in_charge_id: aaron.id,
      user_id: anna.id,
      child_id: gabriel.id,
      details: "Préparation pour le partiel de maths à la fin du mois",
      )

    birthday_appointment = Appointment.create!(
      title: "Anniversaire des 8 ans d'Inès",
      date: Date.new(2024,03,16),
      start_time: DateTime.parse("16/03/2024 14:00"),
      end_time: DateTime.parse("16/03/2024 17:00"),
      category: "Autres",
      address: "4 rue du Professeur Langevin, 59000 LILLE",
      appointment_creator_id: anna.id,
      parent_in_charge_id: aaron.id,
      user_id: anna.id,
      child_id: jade.id,
      details: "Anniversaire à l'Île de Tortuga. Prévoir un cadeau! Inès aime les activités manuelles. Prévoir une tenue décontractée (jogging + chaussettes).",
    )

    puts "...now tasks..."

    homework_task = Task.create!(
      title: "Devoir d'histoire",
      category: "Scolarité",
      details: "Préparer l'exposé sur la Révolution Française. Il faut que l'exposé repose sur 2 supports et dure maximum 15 minutes.",
      requirements: "Livre d'histoire, ressources internet",
      deadline: Date.new(2024,03,16),
      parent_in_charge_id: anna.id,
      child_id: jade.id,
      task_creator_id: anna.id
    )

    geek_task = Task.create!(
      title: "Sortie exposition geek days",
      category: "Autres",
      details: "Prévoir une sortie pour cette fameuse expo! ",
      requirements: "Avoir de bonnes notes à l'école...",
      deadline: Date.new(2024,03,16),
      parent_in_charge_id: aaron.id,
      child_id: jade.id,
      task_creator_id: aaron.id
    )

puts '...Finished!'
