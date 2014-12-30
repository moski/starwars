module Starwars
  #
  # People container
  #
  class People < Starwars::Cursor
    collection :results, class: Starwars::Person,  deserialize: ->(_, fragment, _) { Person.new(fragment) }
  end
end
