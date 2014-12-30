module Starwars
  #
  # Starships Container
  #
  class Starships < Starwars::Cursor
    collection :results, class: Starwars::Starship,  deserialize: ->(_, fragment, _) { Starship.new(fragment) }
  end
end
