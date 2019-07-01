require 'pg'

class User

  attr_reader :id
  attr_reader :email
  attr_reader :password

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      plug = PG.connect(dbname: 'makersbnb_test')
    else
      plug = PG.connect(dbname: 'makersbnb')
    end
    result = plug.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email, password;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end
end