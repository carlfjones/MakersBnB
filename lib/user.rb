require 'pg'

class User

  attr_reader :id
  attr_reader :username
  attr_reader :email
  attr_reader :password

  def self.create(username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      plug = PG.connect(dbname: 'makersbnb_test')
    else
      plug = PG.connect(dbname: 'makersbnb')
    end
    result = plug.exec("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password;")
    User.new(
      id: result[0]['id'], 
      username: result[0]['username'], 
      email: result[0]['email'], 
      password: result[0]['password'],
      )
  end

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end
end
