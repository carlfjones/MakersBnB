

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')

      expect(user).to be_a User
      expect(user.username).to eq('Boss')
      expect(user.id).not_to be_empty
      expect(user.email).to eq('test@email.com')
    end
  end

  describe '.find' do
    it 'finds user by id' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      test_id = user.id
      found_user = User.find(id: test_id)
      expect(found_user).to be_a User
      expect(found_user.username).to eq('Boss')
      expect(found_user.id).to eq(test_id)
      expect(found_user.email).to eq('test@email.com')
    end
  end

  describe '.authenticate' do
    it 'user is able to log in' do
      user = User.create(username: 'Boss', email: 'test@email.com', password: 'pass123')
      loggedinuser = User.authenticate(username: "Boss", password: "pass123")
      expect(loggedinuser.username).to eq(user.username)
    end
  end

end
