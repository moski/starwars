module Starwars
  #
  # A People resource is an individual person or character within the Star Wars universe.
  #
  class Person < Starwars::Base
    #
    # Define the source name in the starwars api
    #
    RESOURCE_NAME = 'people'

    include Starwars::Fetcher

    # @return [String]
    property :name
    property :skin_color
    property :eye_color
    property :hair_color
    property :birth_year
    property :gender
    property :url

    # @return [Integer]
    property :height, type: Integer
    property :mass, type: Integer

    # @return [Starwars::Planet]
    property :homeworld, class: Starwars::Planet, deserialize: ->(_, fragment, _) { Planet.new(url: fragment) }

    # @return [Time]
    property :created, type: Time
    property :edited, type: Time

    # @return [Array]
    collection :films, class: Starwars::Film,  deserialize: ->(_, fragment, _) { Film.new(url: fragment) }
    collection :species, class: Starwars::Specie,  deserialize: ->(_, fragment, _) { Specie.new(url: fragment) }
    collection :vehicles, class: Starwars::Vehicle,  deserialize: ->(_, fragment, _) { Vehicle.new(url: fragment) }
    collection :starships, class: Starwars::Starship,  deserialize: ->(_, fragment, _) { Starship.new(url: fragment) }
  end
end
