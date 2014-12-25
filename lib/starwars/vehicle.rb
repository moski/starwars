module Starwars
  #
  # A Vehicle resource is a single transport craft that does not have hyperdrive capability.
  #
  class Vehicle < Starwars::Base
    #
    # Define the source name in the starwars api
    #
    RESOURCE_NAME = 'vehicles'

    include Starwars::Fetcher

    # @return [String]
    property :name
    property :model
    property :manufacturer
    property :consumables
    property :vehicle_class
    property :cost_in_credits

    # @return [Integer]
    property :max_atmosphering_speed, type: Integer
    property :crew, type: Integer
    property :passengers, type: Integer
    property :cargo_capacity, type: Integer

    # @return [Float]
    property :length, type: Float

    # @return [Time]
    property :created, type: Time
    property :edited, type: Time

    # @return [Array]
    collection :pilots, class: Starwars::Person,  deserialize: ->(_, fragment, _) { Person.new(url: fragment) }
    collection :films, class: Starwars::Film,  deserialize: ->(_, fragment, _) { Film.new(url: fragment) }
  end
end
