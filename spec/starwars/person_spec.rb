describe Starwars::Person do
  before do
    stub_get('/people/2/').to_return(body: fixture('people_2.json'), headers: { content_type: 'application/json; charset=utf-8' })
    stub_get('/people/1/').to_return(body: fixture('people_1.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end

  describe '#==' do
    it 'returns true when objects IDs and URLS are the same' do
      planet = Starwars::Person.new(id: 1, name: 'foo')
      other = Starwars::Person.new(id: 1, name: 'bar')
      expect(planet == other).to be true
    end

    it 'returns false when objects IDs are different' do
      planet = Starwars::Person.new(id: 1)
      other = Starwars::Person.new(id: 2)
      expect(planet == other).to be false
    end
  end

  describe 'getters' do
    subject(:person_2) { Starwars::Person.fetch(2) }
    subject(:person_1) { Starwars::Person.fetch(1) }
    describe '#created' do
      it 'returns a Time when updated is set' do
        expect(person_2.created).to be_a Time
      end
    end
    describe '#edited' do
      it 'returns a Time when edited is set' do
        expect(person_2.edited).to be_a Time
      end
    end
    describe '#name' do
      it 'should have the correct value' do
        expect(person_2.name).to eq 'C-3PO'
      end
    end
    describe '#skin_color' do
      it 'should have the correct value' do
        expect(person_2.skin_color).to eq 'gold'
      end
    end
    describe '#eye_color' do
      it 'should have the correct value' do
        expect(person_2.eye_color).to eq 'yellow'
      end
    end
    describe '#hair_color' do
      it 'should have the correct value' do
        expect(person_2.hair_color).to eq 'n/a'
      end
    end
    describe '#birth_year' do
      it 'should have the correct value' do
        expect(person_2.birth_year).to eq '112BBY'
      end
    end
    describe '#gender' do
      it 'should have the correct value' do
        expect(person_2.gender).to eq 'n/a'
      end
    end
    describe '#url' do
      it 'should have the correct value' do
        expect(person_2.url).to eq 'http://swapi.co/api/people/2/'
      end
    end

    describe '#height' do
      it 'should be an integer' do
        expect(person_2.height).to be_an Integer
      end

      it 'should should have the correct value' do
        expect(person_2.height).to eq 167
      end
    end
    describe '#mass' do
      it 'should be an integer' do
        expect(person_2.mass).to be_an Integer
      end

      it 'should should have the correct value' do
        expect(person_2.mass).to eq 75
      end
    end
    describe '#homeworld' do
      it 'should return a Starwars::Planet object' do
        expect(person_2.homeworld).to be_an Starwars::Planet
      end
      it 'should contains the correct resouce url' do
        expect(person_2.homeworld.url).to eq 'http://swapi.co/api/planets/1/'
      end
    end

    describe '#films' do
      it 'should return an Array' do
        expect(person_2.films).to be_an Array
      end
      it 'should should the correct number of residents' do
        expect(person_2.films.size).to eq 6
      end
      it 'should contain an array of films correctly parsed' do
        film = person_2.films.first
        expect(film).to be_a Starwars::Film
        expect(film.url).to eq 'http://swapi.co/api/films/1/'
      end
    end
    describe '#species' do
      it 'should return an Array' do
        expect(person_2.species).to be_an Array
      end
      it 'should should the correct number of residents' do
        expect(person_2.species.size).to eq 1
      end
      it 'should contain an array of films correctly parsed' do
        specie = person_2.species.first
        expect(specie).to be_a Starwars::Specie
        expect(specie.url).to eq 'http://swapi.co/api/species/2/'
      end
    end
    describe '#vehicles' do
      it 'should return an Array' do
        expect(person_1.vehicles).to be_an Array
      end
      it 'should should the correct number of residents' do
        expect(person_1.vehicles.size).to eq 2
      end
      it 'should contain an array of films correctly parsed' do
        vehicle = person_1.vehicles.first
        expect(vehicle).to be_a Starwars::Vehicle
        expect(vehicle.url).to eq 'http://swapi.co/api/vehicles/14/'
      end
    end
    describe '#starships' do
      it 'should return an Array' do
        expect(person_1.starships).to be_an Array
      end
      it 'should should the correct number of residents' do
        expect(person_1.starships.size).to eq 2
      end
      it 'should contain an array of films correctly parsed' do
        starship = person_1.starships.first
        expect(starship).to be_a Starwars::Starship
        expect(starship.url).to eq 'http://swapi.co/api/starships/12/'
      end
    end
  end
end
