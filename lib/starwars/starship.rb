module Starwars
  #
  # A Starship resource is a single transport craft that has hyperdrive capability.
  #
  class Starship < Starwars::Base
    #
    # Define the source name in the starwars api
    #
    RESOURCE_NAME = 'starships'

    include Starwars::Fetcher

    # @return [String]
    property :name
    property :model
    property :manufacturer
    property :starship_class
    property :consumables

    # @return [Integer]
    property :cost_in_credits, type: Integer
    property :length, type: Integer
    property :max_atmosphering_speed, type: Integer
    property :crew, type: Integer
    property :passengers, type: Integer
    property :cargo_capacity, type: Integer
    # property :MGLT, as: :mglt

    # @return [Float]
    property :hyperdrive_rating, type: Float

    # @return [Time]
    property :created, type: Time
    property :edited, type: Time

    # @return [Array]
    collection :pilots, class: Starwars::Person,  deserialize: ->(_, fragment, _) { Person.new(url: fragment) }
    collection :films, class: Starwars::Film,  deserialize: ->(_, fragment, _) { Film.new(url: fragment) }
  end
end
