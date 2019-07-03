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

  describe '.view_all_requests' do
    it 'lists all of the requests for a space' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      request_user = User.create(username: 'Requestuser', email: 'testy@email.com', password: 'pass1234')
      request = Request.request_booking(2, 1)
      view_requests = Request.view_all_requests(1)
      expect(view_requests.first.space_id).to eq(space.id)
      expect(view_requests.length).to eq(1)
    end
  end

  describe '.approve_request' do
    it 'user can approve a request for a space' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      request_user = User.create(username: 'Requestuser', email: 'testy@email.com', password: 'pass1234')
      request = Request.request_booking(2, 1)
      approve = Request.approve_request(1, 1)
      expect(approve.approve).to eq("t")
    end
  end



end
