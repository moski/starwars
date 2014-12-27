describe Starwars::Base do
  before do
    stub_get('/planets/100/').to_return(status: [404, 'NOT FOUND'], body: fixture('404.json'), headers: { content_type: 'application/json; charset=utf-8' })
    stub_get('/planets/1/').to_return(body: fixture('planets_1.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end

  describe '#fetch' do
    it 'should raise an exception when data not found' do
      planet = Starwars::Base.new(id: 100)
      expect { planet.fetch('planets') }.to raise_error(Starwars::Error::NotFound)
    end

    it 'should raise an exception when argument error' do
      planet = Starwars::Base.new
      expect { planet.fetch('planets') }.to raise_error(Starwars::Error::ArgumentError)
    end

    it 'should raise an exception when the URL is invalid' do
      planet = Starwars::Base.new(url: 'http://swapi.co/api/planets/100/')
      expect { planet.fetch('planets') }.to raise_error(Starwars::Error::NotFound)
    end
  end
end
