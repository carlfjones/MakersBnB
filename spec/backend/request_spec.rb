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

  describe '.tenant_view_all_requests' do
    it 'lists all of the requests made by a tenant' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      request_user = User.create(username: 'Requestuser', email: 'testy@email.com', password: 'pass1234')
      request = Request.request_booking(2, 1)
      view_requests = Request.tenant_view_all_requests(2)
      expect(view_requests.first.space_id).to eq(space.id)
      expect(view_requests.length).to eq(1)
    end
  end

  describe '.landlord_view_all_requests' do
    it 'lists all requests made of a landlord\'s spaces' do
    landlord = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
    space = Space.create(owner_id: landlord.id, name: 'Island', description: 'Pool and palm trees', price: '10')
    request_user = User.create(username: 'Requestuser', email: 'testy@email.com', password: 'pass1234')
    Request.request_booking(2, 2)
    request = Request.request_booking(2, 1)
    request2 = Request.request_booking(3, 1)
    landlord_view_all_requests = Request.landlord_view_all_requests(landlord.id)

    expect(landlord_view_all_requests[0]['name']).to eq(space.name)
    expect(landlord_view_all_requests[0]['username']).to eq(request_user.username)
    expect(landlord_view_all_requests.first.length).to eq(3)
    end
  end

  describe '.approve_request' do
    it 'user can approve a request for a space' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      request_user = User.create(username: 'Requestuser', email: 'testy@email.com', password: 'pass1234')
      request = Request.request_booking(2, 1)
      approved = Request.approve_request(1, 1)
      expect(approved.approved).to eq("t")

    end
  end

end
