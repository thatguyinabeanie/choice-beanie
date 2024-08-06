# typed: false

# file deepcode ignore HardcodedCredential: <please specify a reason of ignoring this>

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.production?
  Rails.logger.info('Seeding is disabled in production.')
  exit
end

# require 'factory_bot'

def create_user(username: nil, email: nil)
  username ||= "regular_user_#{Faker::Internet.unique.username}"
  email ||= "#{username}@battle-stadium-regular-users.com"
  # Check if user already exists
  User.find_or_create_by!(username:) do |the_user|
    the_user.email = email
    the_user.password = SecurePassword.generate_secure_password
    the_user.password_confirmation = the_user.password
    the_user.pronouns = 'they/them'
    the_user.first_name = Faker::Name.first_name
    the_user.last_name = Faker::Name.last_name
  end
end

def create_tournament(name:, organization:, format:, game:, start_at:, end_at:)
  Tournament::Tournament.find_or_create_by!(name:, organization:, format:, game:) do |tournament|
    tournament.start_at = start_at
    tournament.end_at = end_at
  end
end

def create_format(name:, game:)
  Tournament::Format.find_or_create_by!(name:, game:)
end

scarlet_violet = Game.find_or_create_by!(name: 'Pokemon Scarlet & Violet')
sword_and_shield = Game.find_or_create_by!(name: 'Pokemon Sword & Shield')

(1..10).to_a.map { |series| Game.find_or_create_by!(name: "Pokemon Series #{series}") }

sv_formats = %w[A B C D E F G H].map { |regulation| Tournament::Format.find_or_create_by!(name: "Regulation #{regulation}", game: scarlet_violet) }
swsh_formats = (1..13).to_a.map { |series| Tournament::Format.find_or_create_by!(name: "Series #{series}", game: sword_and_shield) }

formats = sv_formats + swsh_formats
formats = sv_formats

org_owners = [
  {
    username: 'fuecoco_supremacy'
  },
  {
    username: 'sprigatito_lover'
  },
  {
    username: 'quaxly_enthusiast'
  }
].map { |user| create_user(username: user[:username]) }

orgs = org_owners.map do |owner|
  Organization.find_by!(owner:)
rescue ActiveRecord::RecordNotFound
  description = 'This is an example organization.'
  staff = (1..5).to_a.map { create_user }
  name = "#{owner[:username].capitalize.gsub('_', ' ')}'s Organization"
  Organization.create!(name:, owner:, description:, staff:)
end.compact

tournaments = orgs.flat_map do |organization|
  formats.map.with_index do |format, index|
    name = "#{organization.name} #{format.name} Tournament #{index + 1}"
    start_at = Time.zone.today
    end_at = Time.zone.today + 1.week
    game = format.game

    tour = create_tournament(name:, organization:, format:, game:, start_at:, end_at:,)

    swiss = Phase::Swiss.create!(
      name: "#{organization.name} #{format.name} Tournament #{index + 1} - Swiss Round",
      tournament: tour,
      number_of_rounds: 5,
      type: 'Phase::Swiss'
    )

    bracket = Phase::SingleEliminationBracket.create!(
      name: "#{organization.name} #{format.name} Tournament #{index + 1} - Top Cut!",
      tournament: tour,
      criteria: 'Top 8',
      type: 'Phase::SingleEliminationBracket'
    )

    tour.add_phase!(phase: swiss)
    tour.add_phase!(phase: bracket)
    tour
  end
end

users = (1..50).to_a.map { create_user }

tournaments.flat_map do |tournament|
  users.sample(rand(1..10)).map do |user|
    pokemon_team = PokemonTeam.create(user:)
    (1..6).to_a.map { PokemonSet.create(pokemon_team:) }

    Tournament::Player.create!(user:, tournament:, in_game_name: Faker::Games::Pokemon.name, pokemon_team:)
  end
end
