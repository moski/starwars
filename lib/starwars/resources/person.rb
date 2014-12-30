module Starwars
  #
  # A People resource is an individual person or character within the Star Wars universe.
  #
  class Person < Starwars::Base
    #
    # Define the source name in the starwars api
    #
    RESOURCE_NAME = 'people'

    # The name of this person
    # @return [String]
    # @example
    #   person.name
    # @api public
    property :name

    # The skin color of this person
    # @return [String]
    # @example
    #   person.skin_color
    # @api public
    property :skin_color

    # The eye color of this person
    #
    # @return [String]
    #
    # @note Will be "unknown" if not known or "n/a"
    #       if the person does not have an eye
    #
    # @example
    #   person.eye_color
    # @api public
    property :eye_color

    # The hair color of this person
    #
    # @return [String]
    #
    # @note: Will be "unknown" if not known or "n/a"
    #        if the person does not have hair
    #
    # @example
    #   person.hair_color
    # @api public
    property :hair_color

    # The birth year of the person
    #
    # @return [String]
    #
    # @note using the in-universe standard of
    # BBY or ABY - Before the Battle of Yavin or After the Battle of Yavin.
    # The Battle of Yavin is a battle that occurs at the end of Star Wars
    # episode IV: A New Hope
    #
    # @example
    #   person.birth_year
    # @api public
    property :birth_year

    # The gender of this person
    #
    # @return [String]
    #
    # @note Either "Male", "Female" or "unknown", "n/a"
    #       if the person does not have a gender
    #
    # @example
    #   person.gender
    # @api public
    property :gender

    # The height of the person in centimeters
    # @return [Integer]
    # @example
    #   person.height
    # @api public
    property :height, type: Integer

    # The mass of the person in kilograms
    # @return [Integer]
    # @example
    #   person.mass
    # @api public
    property :mass, type: Integer

    # List of homeworlds
    # @return [Array<Planet>]
    # @example
    #   person.homeworlds
    # @api public
    property :homeworld, class: Starwars::Planet, deserialize: ->(_, fragment, _) { Planet.new(url: fragment) }

    # List of films
    # @return [Array<Film>]
    # @example
    #   person.films
    # @api public
    collection :films, class: Starwars::Film,  deserialize: ->(_, fragment, _) { Film.new(url: fragment) }

    # List of species
    # @return [Array<Specie>]
    # @example
    #   person.species
    # @api public
    collection :species, class: Starwars::Specie,  deserialize: ->(_, fragment, _) { Specie.new(url: fragment) }

    # List of vehicles
    # @return [Array<Vehicle>]
    # @example
    #   person.vehicles
    # @api public
    collection :vehicles, class: Starwars::Vehicle,  deserialize: ->(_, fragment, _) { Vehicle.new(url: fragment) }

    # List of tarships
    # @return [Array<Starship>]
    # @example
    #   person.starships
    # @api public
    collection :starships, class: Starwars::Starship,  deserialize: ->(_, fragment, _) { Starship.new(url: fragment) }
  end
end
