module Serializer
  class PlayerSerializer < ActiveModel::Serializer
    attribute :user_id
    attribute :first_name
    attribute :last_name
    attribute :username
    attribute :team_submission

    def user_id
      object.player.id
    end

    def first_name
      object.player.first_name
    end

    def last_name
      object.player.last_name
    end

    def username
      object.player.username
    end

    def team_submission
      object.pokemon_sets.map do |pokemon_set|
        {
          id: pokemon_set.id,
          name: pokemon_set.name,
          ability: pokemon_set.ability,
          tera_type: pokemon_set.tera_type,
          nature: pokemon_set.nature,
          held_item: pokemon_set.held_item,
          move1: pokemon_set.move1,
          move2: pokemon_set.move2,
          move3: pokemon_set.move3,
          move4: pokemon_set.move4
        }
      end
    end
  end
end
