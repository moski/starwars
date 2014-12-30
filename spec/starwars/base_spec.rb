describe Starwars::Base do
  before do
    stub_get('/planets/100/').to_return(status: [404, 'NOT FOUND'], body: fixture('404.json'), headers: { content_type: 'application/json; charset=utf-8' })
    stub_get('/planets/1/').to_return(body: fixture('planets_1.json'), headers: { content_type: 'application/json; charset=utf-8' })
  end
  describe '#fetch' do
    it 'should raise an exception when argument error' do
      base = Starwars::Base.new
      expect { base.fetch }.to raise_error(Starwars::Error::ArgumentError)
    end
  end
  describe '#link' do
    it 'should return the same string if passed a string' do
      expect(Starwars::Base.send('link', '/something')).to eq '/something'
    end
  end
end
