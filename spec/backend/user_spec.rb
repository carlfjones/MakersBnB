require 'user.rb'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')

      expect(user).to be_a User
      expect(user.username).to eq 'Boss'
      expect(user.id).not_to be_empty
      expect(user.email).to eq 'test@email.com'
    end
  end
end