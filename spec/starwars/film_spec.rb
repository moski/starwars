describe Starwars::Film do
  before do
    stub_get('/films/1/').to_return(body: fixture('films_1.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end
  describe '#==' do
    it 'returns true when objects IDs and URLS are the same' do
      planet = Starwars::Film.new(id: 1, title: 'foo')
      other = Starwars::Film.new(id: 1, title: 'bar')
      expect(planet == other).to be true
    end

    it 'returns false when objects IDs are different' do
      planet = Starwars::Film.new(id: 1)
      other = Starwars::Film.new(id: 2)
      expect(planet == other).to be false
    end
  end

  describe 'getters' do
    subject(:film) { Starwars::Film.fetch(1) }
    describe '#created' do
      it 'returns a Time when updated is set' do
        expect(film.created).to be_a Time
      end
    end
    describe '#edited' do
      it 'returns a Time when edited is set' do
        expect(film.edited).to be_a Time
      end
    end
    describe '#title' do
      it 'should have the correct value' do
        expect(film.title).to eq 'A New Hope'
      end
    end
    describe '#opening_crawl' do
      it 'should have the correct value' do
        expect(film.opening_crawl.include?('It is a period of civil war')).to eq true
      end
    end
    describe '#director' do
      it 'should have the correct value' do
        expect(film.director).to eq 'George Lucas'
      end
    end
    describe '#producer' do
      it 'should have the correct value' do
        expect(film.producer).to eq 'Gary Kurtz, Rick McCallum'
      end
    end
    describe '#url' do
      it 'should have the correct value' do
        expect(film.url).to eq 'http://swapi.co/api/films/1/'
      end
    end

    describe '#episode_id' do
      it 'should be an integer' do
        expect(film.episode_id).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(film.episode_id).to eq 4
      end
    end

    describe '#starships' do
      it 'should return an Array' do
        expect(film.starships).to be_an Array
      end
      it 'should should the correct number of starships' do
        expect(film.starships.size).to eq 8
      end
      it 'should contain an array of starships correctly parsed' do
        starship = film.starships.first
        expect(starship).to be_a Starwars::Starship
        expect(starship.url).to eq 'http://swapi.co/api/starships/2/'
      end
    end
    describe '#vehicles' do
      it 'should return an Array' do
        expect(film.vehicles).to be_an Array
      end
      it 'should should the correct number of vehicles' do
        expect(film.vehicles.size).to eq 4
      end
      it 'should contain an array of films correctly parsed' do
        vehicle = film.vehicles.first
        expect(vehicle).to be_a Starwars::Vehicle
        expect(vehicle.url).to eq 'http://swapi.co/api/vehicles/4/'
      end
    end
    describe '#species' do
      it 'should return an Array' do
        expect(film.species).to be_an Array
      end
      it 'should should the correct number of species' do
        expect(film.species.size).to eq 5
      end
      it 'should contain an array of films correctly parsed' do
        specie = film.species.first
        expect(specie).to be_a Starwars::Specie
        expect(specie.url).to eq 'http://swapi.co/api/species/1/'
      end
    end
    describe '#characters' do
      it 'should return an Array' do
        expect(film.characters).to be_an Array
      end
      it 'should should the correct number of characters' do
        expect(film.characters.size).to eq 18
      end
      it 'should contain an array of characters correctly parsed' do
        person = film.characters.first
        expect(person).to be_a Starwars::Person
        expect(person.url).to eq 'http://swapi.co/api/people/1/'
      end
    end
    describe '#planets' do
      it 'should return an Array' do
        expect(film.planets).to be_an Array
      end
      it 'should should the correct number of planets' do
        expect(film.planets.size).to eq 3
      end
      it 'should contain an array of planets correctly parsed' do
        planet = film.planets.first
        expect(planet).to be_a Starwars::Planet
        expect(planet.url).to eq 'http://swapi.co/api/planets/2/'
      end
    end
  end
end
