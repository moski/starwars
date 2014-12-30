module Starwars
  #
  # A Film resource is an single film.
  #
  class Film < Starwars::Base
    # Define the source name in the starwars api
    RESOURCE_NAME = 'films'

    # The title of this film
    # @return [String]
    # @example
    #   film.title #=> 'A New Hope'
    # @api public
    property :title

    # The opening paragraphs at the beginning of this film
    # @return [String]
    # @example
    #   film.opening_crawl #=> 'It is a period of civil war ...'
    # @api public
    property :opening_crawl

    # The name of the director of this film
    # @return [String]
    # @example
    #   film.director #=> 'George Lucas'
    # @api public
    property :director

    # The name(s) of the producer(s) of this film. Comma seperated
    # @return [String]
    # @example
    #   film.producer #=> 'Gary Kurtz, Rick McCallum'
    # @api public
    property :producer

    # The episode number of this film
    # @return [Integer]
    # @example
    #   film.episode_id #=> 1
    # @api public
    property :episode_id, type: Integer

    # List of people
    # @return [Array<Person>]
    # @example
    #   film.characters
    # @api public
    collection :characters, class: Starwars::Person,  deserialize: ->(_, fragment, _) { Person.new(url: fragment) }

    # List of planets
    # @return [Array<Person>]
    # @example
    #   film.characters
    # @api public
    collection :planets, class: Starwars::Planet,  deserialize: ->(_, fragment, _) { Planet.new(url: fragment) }

    # List of starships
    # @return [Array<Starship>]
    # @example
    #   film.starships
    # @api public
    collection :starships, class: Starwars::Starship,  deserialize: ->(_, fragment, _) { Starship.new(url: fragment) }

    # List of vehicles
    # @return [Array<Vehicle>]
    # @example
    #   film.vehicles
    # @api public
    collection :vehicles, class: Starwars::Vehicle,  deserialize: ->(_, fragment, _) { Vehicle.new(url: fragment) }

    # List of species
    # @return [Array<Specie>]
    # @example
    #   film.species
    # @api public
    collection :species, class: Starwars::Specie,  deserialize: ->(_, fragment, _) { Specie.new(url: fragment) }
  end
end
