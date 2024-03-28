# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "Cleaning Database..."
Contact.destroy_all
Document.destroy_all
Appointment.destroy_all
Task.destroy_all
Child.destroy_all
User.destroy_all
puts "Database cleaned..."

puts "Creating users..."
anna_photo = URI.open("https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1961&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
anna = User.new(
  first_name: 'Anna',
  email: 'anna@lewagon.fr',
  password: 'anna123',
  phone_number: "06 12 13 14 15")
anna.photo.attach(io: anna_photo, filename: "anna", content_type: "image/avif")
anna.save!

aaron_photo = URI.open("https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
aaron = User.new(
  first_name: 'Aaron',
  email: 'aaron@lewagon.fr',
  password: 'aaron123',
  phone_number: '06 01 02 03 04')
aaron.photo.attach(io: aaron_photo, filename: "aaron", content_type: "image/avif")
aaron.save!
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
    first_name: "Gabriel",
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 6, max_age: 11),
    birth_place: "Paris",
    school: "École élémentaire Jules Ferry",
    first_parent_id: anna.id,
    second_parent_id: aaron.id
  )

jade = Child.create!(
  first_name: "Jade",
  last_name: Faker::Name.last_name,
  birth_date: Faker::Date.birthday(min_age: 6, max_age: 11),
  birth_place: "Paris",
  school: "École élémentaire Jules Ferry",
  first_parent_id: anna.id,
  second_parent_id: aaron.id
)

puts "...and appointments..."
foot_appointment = Appointment.create!(
  title: "Match de foot",
  date: Date.new(2024,03,30),
  start_time: DateTime.parse("30/03/2024 16:30"),
  end_time: DateTime.parse("30/03/2024 18:00"),
  category: "Activités",
  address: "261 Boulevard de Tournai, 59650 Villeneuve d'Ascq",
  appointment_creator_id: anna.id,
  parent_in_charge_id: aaron.id,
  user_id: anna.id,
  child_id: gabriel.id,
  rich_details: "Match de foot avec Paul en entraîneur (groupe 2B). Ne pas oublier le sac avec la tenue, les crampons, serviette et gourde!",
  )

  dentist_appointment = Appointment.create!(
    title: "Dentiste",
    date: Date.new(2024,04,02),
    start_time: DateTime.parse("02/04/2024 11:00"),
    end_time: DateTime.parse("02/04/2024 12:00"),
    category: "Santé",
    address: "4 Allée de la chambre, 33160 Bordeaux",
    appointment_creator_id: anna.id,
    parent_in_charge_id: anna.id,
    user_id: anna.id,
    child_id: gabriel.id,
    rich_details: "La prochaine fois tu te laveras les dents",
    )

    # maths_appointment = Appointment.create!(
    #   title: "Soutien de maths",
    #   date: Date.new(2024,04,27),
    #   start_time: DateTime.parse("06/04/2024 17:30"),
    #   end_time: DateTime.parse("06/04/2024 19:00"),
    #   category: "Scolarité",
    #   address: "En Ligne",
    #   appointment_creator_id: anna.id,
    #   parent_in_charge_id: aaron.id,
    #   user_id: anna.id,
    #   child_id: jade.id,
    #   rich_details: "Préparation pour le devoir de maths à la fin du mois",
    #   )

    birthday_appointment = Appointment.create!(
      title: "Anniversaire des 8 ans d'Inès",
      date: Date.new(2024,03,30),
      start_time: DateTime.parse("30/03/2024 14:00"),
      end_time: DateTime.parse("30/03/2024 17:00"),
      category: "Autres",
      address: "4 rue du Professeur Langevin, 59000 LILLE",
      appointment_creator_id: anna.id,
      parent_in_charge_id: anna.id,
      user_id: anna.id,
      child_id: jade.id,
      rich_details: "Anniversaire à l'Île de Tortuga. Le cadeau a été acheté et sera dans le sac de Jade. Prévoir une tenue décontractée (jogging + chaussettes).",
    )

    puts "...now tasks..."

    homework_task = Task.create!(
      title: "Devoir d'histoire",
      category: "Scolarité",
      rich_details: "Préparer l'exposé sur la Révolution Française. Il faut que l'exposé repose sur 2 supports et dure maximum 15 minutes.",
      # deadline: Date.new(2024,04,08),
      status: false,
      parent_in_charge_id: anna.id,
      child_id: gabriel.id,
      task_creator_id: anna.id
    )

    # geek_task = Task.create!(
    #   title: "Sortie exposition geek days",
    #   category: "Autres",
    #   rich_details: "Prévoir une sortie pour cette fameuse expo avant qu'elle ne se termine ! Et rappeler à Jade la condition : avoir de bonnes notes à l'école...",
    #   deadline: Date.new(2024,04,12),
    #   status: false,
    #   parent_in_charge_id: aaron.id,
    #   child_id: jade.id,
    #   task_creator_id: aaron.id
    # )

    gift_task = Task.create!(
      title: "Trouver un cadeau pour Inès",
      category: "Autres",
      rich_details: "Chercher cadeau pour l'anniversaire. Elle aime les licornes. Et les bonbons.",
      # deadline: Date.new(2024,03,30),
      status: false,
      parent_in_charge_id: anna.id,
      child_id: jade.id,
      task_creator_id: aaron.id
    )

    glasses_task = Task.create!(
      title: "Récupérer les lunettes",
      category: "Santé",
      rich_details: "Les lunettes sont arrivées chez l'opticien (celui du centre commercial). Ne pas oublier de prendre l'attestation de mutuelle",
      # deadline: Date.new(2024,04,06),
      status: false,
      parent_in_charge_id: aaron.id,
      child_id: gabriel.id,
      task_creator_id: aaron.id
    )

puts '...Finished!'
