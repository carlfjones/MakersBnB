require 'space.rb'

describe Space do
  describe '.create' do
    it 'creates a new space' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      expect(space).to be_a Space
      expect(space.owner_id).to eq(user.id)
      expect(space.id).not_to be_empty
      expect(space.name).to eq('Island')
      expect(space.description).to eq('Pool and palm trees')
      expect(space.booking).to eq('f')
      expect(space.price).to eq("10")
    end
  end

  describe '.find' do
    it 'finds space by id' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      found_space = Space.find(id: space.id)
      expect(found_space.id).to eq(space.id)
    end
  end

  describe '.viewall' do
    it 'lists all of the spaces' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      space1 = Space.create(owner_id: user.id, name: 'Castle', description: 'Bricks', price: '100')
      space2 = Space.create(owner_id: user.id, name: 'Tent', description: 'Cold', price: '200')
      view = Space.viewall
      expect(view.length).to eq(3)
      expect(view.first.id).to eq("1")
    end
  end

end
