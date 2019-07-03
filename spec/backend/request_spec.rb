require 'request'

describe Request do

  describe '.request_booking' do
    it 'user can request to book a space' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      request_user = User.create(username: 'Requestuser', email: 'testy@email.com', password: 'pass1234')
      request = Request.request_booking(2, 1)
      expect(request.user_id).to eq(request_user.id)
      expect(request.space_id).to eq(space.id)
    end
  end

end
