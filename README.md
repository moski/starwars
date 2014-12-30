# Starwars

[![Coverage Status](https://coveralls.io/repos/moski/starwars/badge.png?branch=master)](https://coveralls.io/r/moski/starwars?branch=master)
[![Build Status](https://travis-ci.org/moski/starwars.svg?branch=master)](https://travis-ci.org/moski/starwars)
[![Inline docs](http://inch-ci.org/github/moski/starwars.svg?branch=master&style=flat)](http://inch-ci.org/github/moski/starwars)
[![Code Climate](https://codeclimate.com/github/moski/starwars/badges/gpa.svg)](https://codeclimate.com/github/moski/starwars)

A Ruby interface for http://swapi.co/ - the Star Wars API
![Starwars](https://s3.amazonaws.com/f.cl.ly/items/1r2F2K460v1R2o011n1M/star-wars-evolution-evolution-funny.jpg)

## API Support
- [x] Films API
- [x] People API
- [x] Planet API
- [x] Species API
- [x] Vehicles API
- [x] Starship API


## Installation

Add this line to your application's Gemfile:

    gem 'starwars'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install starwars


## Available Resources

* `Starwars::Person` ([see docs](https://github.com/moski/starwars/blob/master/lib/starwars/resources/person.rb))
* `Starwars::Film` ([see docs](https://github.com/moski/starwars/blob/master/lib/starwars/resources/film.rb))
* `Starwars::Planet` ([see docs](https://github.com/moski/starwars/blob/master/lib/starwars/resources/planet.rb))
* `Starwars::Specie` ([see docs](https://github.com/moski/starwars/blob/master/lib/starwars/resources/specie.rb))
* `Starwars::Starship` ([see docs](https://github.com/moski/starwars/blob/master/lib/starwars/resources/starship.rb))
* `Starwars::Vehicle` ([see docs](https://github.com/moski/starwars/blob/master/lib/starwars/resources/vehicle.rb))

## Usage

All the resources defined above have 2 functions, `#fetch` and `#fetch_all` 

## #Fetch

`#fetch` is used to fetch a single resource via ID or Resource URL

```ruby
Starwars::Person.fetch(1).name
Starwars::Person.fetch('http://swapi.co/api/people/3/').name
```

## #fetch_all

`#fetch_all` is used to fetch all resources via pagination 

```ruby
planets = Starwars::Planet.fetch_all

# to access the items use #items
planets.items.map(&:name)
planets.items.each{|item| p item.inspect}

# you can also use #results instead of iteams
planets.results.map(&:name)
```

## Pagination

using `#fetch_all` will yield a pagination response:

```ruby
starships = Starwars::Starship.fetch_all
p starships.number_of_pages
p starships.last_page?
p starships.next_page?
```

To iterate pages you can use the following interface:

```ruby
Starwars::Starship.fetch_all.each{|page|
  p page.next
  p page.previous
  p page.results.size
}
```

## Documentation

the gem is fairly documented. Browse the YARD [documentaion](http://rubydoc.info/gems/starwars/) for more information.


## Contributing

1. Fork it ( https://github.com/moski/starwars/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request