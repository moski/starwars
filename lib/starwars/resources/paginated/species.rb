module Starwars
  #
  # Species container
  #
  class Species < Starwars::Cursor
    collection :results, class: Starwars::Specie,  deserialize: ->(_, fragment, _) { Specie.new(fragment) }
  end
end
