module Starwars
  #
  # A Species resource is a type of person or character within the Star Wars Universe.
  #
  class Specie < Starwars::Base
    #
    # Define the source name in the starwars api
    #
    RESOURCE_NAME = 'species'

    property :name
    property :classification
    property :designation
    property :skin_colors
    property :hair_colors
    property :eye_colors
    property :language
    property :homeworld, class: Starwars::Planet, deserialize: ->(_, fragment, _) { Planet.new(url: fragment) }
    property :average_height, type: Integer
    property :average_lifespan, type: Integer
    collection :people, class: Starwars::Person,  deserialize: ->(_, fragment, _) { Person.new(url: fragment) }
    collection :films, class: Starwars::Film,  deserialize: ->(_, fragment, _) { Film.new(url: fragment) }
  end
end
