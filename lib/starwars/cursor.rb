module Starwars
  #
  # A pagination container for starwars
  #
  class Cursor < Starwars::Base
    include Enumerable

    #
    # including Enumerable adds a "count" method to the class
    # and for some reason:
    # property :count, as: number_of_pages
    # is not working, i am not sure it's a roar thing or from the representable gem.
    # As a workaround, lets create "number_of_pages" method that returns
    # the count property
    # @todo - check why as: is not working
    property :count

    #
    # Next holds the URL for the next page. If there is no next page, next
    # should be set to nil
    property :next

    #
    # Previous holds the URL for the previous page. If there is no previous
    # page previous should be set to nil
    property :previous

    # Results contains the results within the page.
    #
    collection :results

    # A wrapper to get the pages count from the api
    # @return [Integer]
    # @example get the total number of pages
    #   Starwars::Planet.fetch_all.number_of_pages
    # @example get the total number of pages
    #   Starwars::Starship.fetch_all.number_of_pages
    # @api public
    def number_of_pages
      self[:count]
    end

    # A wrapper to get the results within a page
    # @note This wrapper is needed to define the items alias method
    # @return [Array]
    # @example Return the items array within the page
    #   Starwars::Planet.fetch_all.results
    #   Starwars::Planet.fetch_all.items
    # @api public
    def results
      self[:results]
    end

    # Checks wheather this is the last page
    # @return [Boolean]
    # @example are we at the last page?
    #   Starwars::Planet.fetch_all.last_page?
    # @api public
    def last_page?
      !next_page?
    end

    # Checks wheather this there is more pages
    # @return [Boolean]
    # @example do we have a next page?
    #   Starwars::Planet.fetch_all.next_page?
    # @api public
    def next_page?
      !self.next.nil?
    end

    # Returns the next page
    # @return [Starwars::Base]
    # @example fetch the next page
    #   page = Starwars::Planet.fetch_all
    #   page.next_page
    # @api public
    def next_page
      return if last_page?
      perform_request
    end

    # Yields the subsequent page responses to a given block
    # @yieldparam [Starwars::Base] response
    # @return [Enumerable, nil]
    # @example fetch the next page
    #   Starwars::Planet.fetch_all.each_page{|page| p page.items.map(&:name)}
    #   Starwars::Planet.fetch_all.each{|page| p page.items.map(&:name)}
    #   Starwars::Planet.fetch_all.each_with_index{|page, index|
    #     p page.items.map(&:name)
    #   }
    # @api public
    def each_page
      return to_enum(__callee__) unless block_given?
      yield(next_page) until last_page?
    end

    alias_method :each, :each_page
    alias_method :items, :results

    private

    # Delegate to the request class to perform fetch data from remote server
    # @return [People, Films, Planets, Species, Starships, Vehicles]
    # @api private
    def perform_request
      Request.new(request_attributes(uri: self.next)).perform_request
    end
  end
end
