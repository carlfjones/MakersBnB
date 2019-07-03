require_relative './db'

class User

  attr_reader :id
  attr_reader :username
  attr_reader :email
  attr_reader :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.create(username:, email:, password:)
    DatabaseConnection.connect
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password;")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password'],
      )
  end

  def self.find(id:)
    DatabaseConnection.connect
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password'],
      )
  end

  def self.authenticate(username:, password:)
    DatabaseConnection.connect
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}' AND password = '#{password}';")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password'],
      )
  end

end
