module Starwars
  #
  # A Film resource is an single film.
  #
  class Film < Starwars::Base
    #
    # Define the source name in the starwars api
    #
    RESOURCE_NAME = 'films'

    include Starwars::Fetcher

    # @return [String]
    property :title
    property :opening_crawl
    property :director
    property :producer
    property :url

    # @return [Integer]
    property :id, type: Integer
    property :episode_id, type: Integer

    # @return [Time]
    property :created, type: Time
    property :edited, type: Time

    # @return [Array]
    collection :characters, class: Starwars::Person,  deserialize: ->(_, fragment, _) { Person.new(url: fragment) }
    collection :planets, class: Starwars::Planet,  deserialize: ->(_, fragment, _) { Planet.new(url: fragment) }
    collection :starships, class: Starwars::Starship,  deserialize: ->(_, fragment, _) { Starship.new(url: fragment) }
    collection :vehicles, class: Starwars::Vehicle,  deserialize: ->(_, fragment, _) { Vehicle.new(url: fragment) }
    collection :species, class: Starwars::Specie,  deserialize: ->(_, fragment, _) { Specie.new(url: fragment) }
  end
end
