require_relative './db'

class User

  attr_reader :id
  attr_reader :username
  attr_reader :email
  attr_reader :password

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

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end
end
