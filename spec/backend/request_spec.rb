require 'request'
require 'Time'

describe Request do

  # doing time stuff
  from_date = Time.parse('2019-08-01').to_s.slice(0..9)
  to_date = Time.parse('2019-08-02').to_s.slice(0..9)

  describe '.request_booking' do
    it 'user can request to book a space' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      request_user = User.create(username: 'Requestuser', email: 'testy@email.com', password: 'pass1234')
      request = Request.request_booking(2, 1, from_date, to_date)
      expect(request.user_id).to eq(request_user.id)
      expect(request.space_id).to eq(space.id)
     
      expect(request.from_date).to eq(from_date)
      expect(request.to_date).to eq(to_date)
    end
  end

  describe '.tenant_view_all_requests' do
    it 'lists all of the requests made by a tenant' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      space = Space.create(owner_id: user.id, name: 'Island', description: 'Pool and palm trees', price: '10')
      request_user = User.create(username: 'Requestuser', email: 'testy@email.com', password: 'pass1234')
      request = Request.request_booking(2, 1, from_date, to_date)
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
    Request.request_booking(2, 2, from_date, to_date)
    request = Request.request_booking(2, 1, from_date, to_date)
    request2 = Request.request_booking(3, 1, from_date, to_date)
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
      request = Request.request_booking(2, 1, from_date, to_date)
      approved = Request.approve_request(1, 1)
      expect(approved.approved).to eq("t")

    end
  end

end
