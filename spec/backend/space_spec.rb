require 'space.rb'

describe Space do
  describe '.create' do
    it 'creates a new space' do
      space = Space.create(owner_id: session[:id], name: 'Island', description: 'Pool and palm trees', price: '10')
      expect(space).to be_a Space
      expect(space.owner_id).not_to be_empty
      expect(space.id).not_to be_empty
      expect(space.name).to eq 'Island'
      expect(space.description).to eq 'Pool and palm trees'
      expect(space.booking).to be(false)
      expect(space.price).to eq(10)
    end
  end
end