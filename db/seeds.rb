# typed: false

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user_1 = User.create!(
  username: 'fuecoco_supremacy',
  email: 'fuecoco_supremacy@example.com',
  password: 'password',
  password_confirmation: 'password'
)

user_1 = User.create!(
  username: 'sprigatito_lover',
  email: 'sprigatito_lover@example.com',
  password: 'password',
  password_confirmation: 'password'
)

org = Organization::Organization.create!(
  name: 'Example Organization',
  user: user_1,
  description: 'This is an example organization.'
)

org.staff << user_1
org.save!

scarlet_violet = Game.create!(name: 'Pokemon Scarlet & Violet')
sword_and_shield = Game.create!(name: 'Pokemon Sword & Shield')

%w[A B C D E F G H].each do |regulation|
  format = Tournament::Format.create!(name: "Regulation #{regulation}", game: scarlet_violet)
  scarlet_violet.tournament_formats << format
end

%w[1..13].each do |series|
  format = Tournament::Format.create!(name: "Series #{series}", game: sword_and_shield)
  sword_and_shield.tournament_formats << format
end

reg_g = scarlet_violet.tournament_formats.find_by(name: 'Regulation G')

tour = Tournament::Tournament.new(
  name: 'Example Tournament',
  organization: org,
  start_date: Time.zone.today,
  check_in_start_time: Time.zone.now,
  game: scarlet_violet,
  tournament_format: reg_g
)

tour.save!

# swiss_phase = Phase::Swiss.create!(tournament: tour, number_of_rounds: 5)
# topcut_phase = Phase::SingleEliminationBracket.create!(tournament: tour, criteria: 'Top 8')

# tour.phases << swiss_phase
# tour.phases << topcut_phase
