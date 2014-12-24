describe Starwars::Starship do
  before do
    stub_get('/starships/5/').to_return(body: fixture('starships_5.json'), headers: { content_type: 'application/json; charset=utf-8' })
    stub_get('/starships/10/').to_return(body: fixture('starships_10.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end

  describe '#==' do
    it 'returns true when objects IDs and URLS are the same' do
      starship = Starwars::Starship.new(id: 1, title: 'foo')
      other = Starwars::Starship.new(id: 1, title: 'bar')
      expect(starship == other).to be true
    end

    it 'returns false when objects IDs are different' do
      starship = Starwars::Starship.new(id: 1)
      other = Starwars::Starship.new(id: 2)
      expect(starship == other).to be false
    end
  end

  describe 'getters' do
    subject(:starship) { Starwars::Starship.fetch(5) }
    subject(:mf) { Starwars::Starship.fetch(10) }
    describe '#created' do
      it 'returns a Time when updated is set' do
        expect(starship.created).to be_a Time
      end
    end
    describe '#edited' do
      it 'returns a Time when edited is set' do
        expect(starship.edited).to be_a Time
      end
    end
    describe '#name' do
      it 'should have the correct value' do
        expect(starship.name).to eq 'Sentinel-class landing craft'
      end
    end
    describe '#model' do
      it 'should have the correct value' do
        expect(starship.model).to eq 'Sentinel-class landing craft'
      end
    end
    describe '#manufacturer' do
      it 'should have the correct value' do
        expect(starship.manufacturer).to eq 'Sienar Fleet Systems, Cyngus Spaceworks'
      end
    end
    describe '#starship_class' do
      it 'should have the correct value' do
        expect(starship.starship_class).to eq 'landing craft'
      end
    end
    describe '#consumables' do
      it 'should have the correct value' do
        expect(starship.consumables).to eq '1 month'
      end
    end

    describe '#cost_in_credits' do
      it 'should be an integer' do
        expect(starship.cost_in_credits).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(starship.cost_in_credits).to eq 240_000
      end
    end
    describe '#length' do
      it 'should be an integer' do
        expect(starship.length).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(starship.length).to eq 38
      end
    end
    describe '#max_atmosphering_speed' do
      it 'should be an integer' do
        expect(starship.max_atmosphering_speed).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(starship.max_atmosphering_speed).to eq 1_000
      end
    end
    describe '#crew' do
      it 'should be an integer' do
        expect(starship.crew).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(starship.crew).to eq 5
      end
    end
    describe '#passengers' do
      it 'should be an integer' do
        expect(starship.passengers).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(starship.passengers).to eq 75
      end
    end
    describe '#cargo_capacity' do
      it 'should be an integer' do
        expect(starship.cargo_capacity).to be_an Integer
      end
      it 'should should have the correct value' do
        expect(starship.cargo_capacity).to eq 180_000
      end
    end
    describe '#hyperdrive_rating' do
      it 'should be an integer' do
        expect(starship.hyperdrive_rating).to be_an Float
      end
      it 'should should have the correct value' do
        expect(starship.hyperdrive_rating).to eq 1.0
      end
    end

    describe '#films' do
      it 'should return an Array' do
        expect(starship.films).to be_an Array
      end
      it 'should should the correct number of films' do
        expect(starship.films.size).to eq 1
      end
      it 'should contain an array of films correctly parsed' do
        film = starship.films.first
        expect(film).to be_a Starwars::Film
        expect(film.url).to eq 'http://swapi.co/api/films/1/'
      end
    end
    describe '#pilots' do
      it 'should return an Array' do
        expect(mf.pilots).to be_an Array
      end
      it 'should should the correct number of pilots' do
        expect(mf.pilots.size).to eq 4
      end
      it 'should contain an array of pilots correctly parsed' do
        person = mf.pilots.first
        expect(person).to be_a Starwars::Person
        expect(person.url).to eq 'http://swapi.co/api/people/13/'
      end
    end
  end
end
