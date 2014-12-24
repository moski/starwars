module Starwars
  #
  # A Planet resource is a large mass, planet or planetoid in
  # the Star Wars Universe, at the time of 0 ABY.
  #
  class Planet < Starwars::Base
    #
    # Define the source name in the starwars api
    #
    RESOURCE_NAME = 'planets'

    include Starwars::Fetcher

    # @return [String]
    property :name
    property :climate
    property :gravity
    property :terrain
    property :url

    # @return [Integer]
    property :id, type: Integer
    property :population, type: Integer
    property :rotation_period, type: Integer
    property :orbital_period, type: Integer
    property :surface_water, type: Integer
    property :diameter, type: Integer

    # @return [Time]
    property :created, type: Time
    property :edited, type: Time

    # @return [Array]
    collection :residents, class: Starwars::Person,  deserialize: ->(_, fragment, _) { Person.new(url: fragment) }
    collection :films, class: Starwars::Film,  deserialize: ->(_, fragment, _) { Film.new(url: fragment) }
  end
end
