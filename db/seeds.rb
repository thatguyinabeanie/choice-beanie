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

def generate_faker_users
  (1..5).to_a.map do
    User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end
end

scarlet_violet = Game.create!(name: 'Pokemon Scarlet & Violet')
sword_and_shield = Game.create!(name: 'Pokemon Sword & Shield')

sv_formats = %w[A B C D E F G H].map { |regulation| Tournament::Format.create!(name: "Regulation #{regulation}", game: scarlet_violet) }
swsh_formats = (1..13).to_a.map { |series| Tournament::Format.create!(name: "Series #{series}", game: sword_and_shield) }
formats = sv_formats + swsh_formats

users = [
  {
    first_name: 'Pablo',
    last_name: 'Escobar',
    username: 'fuecoco_supremacy'
  },
  {
    first_name: 'Ash',
    last_name: 'Ketchum',
    username: 'sprigatito_lover'
  },
  {
    first_name: 'Jake',
    last_name: 'Peralta',
    username: 'quaxly_enthusiast'
  }
]

org_owners = users.map do |owner|
  User.create!(
    first_name: owner[:first_name],
    last_name: owner[:last_name],
    username: owner[:username],
    email: "#{owner[:username]}@example.com",
    password: Faker::Internet.password
  )
end

orgs = org_owners.map do |owner|
  Organization::Organization.create!(
    name: "#{owner[:username].capitalize.gsub('_', ' ')}'s Organization",
    user: owner,
    description: 'This is an example organization.',
    staff: generate_faker_users
  )
end
orgs.map do |org|
  formats.map.with_index do |tour_format, index|
    tour = Tournament::Tournament.create!(
      name: "#{org.name} #{tour_format.name} Tournament #{index + 1}",
      organization: org,
      start_date: Time.zone.today,
      ended_at: Time.zone.today + 1.week,
      check_in_start_time: Time.zone.now,
      format: tour_format,
      game: tour_format.game
    )

    Phase::Swiss.create!(
      tournament: tour,
      number_of_rounds: 5
    )

    Phase::SingleEliminationBracket.create!(
      tournament: tour,
      criteria: 'Top 8'
    )

    tour.save!
    tour
  end
end
