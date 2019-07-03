require 'pg'


def setup_test_database
  p "Setting up test database"

  connection = PG.connect(dbname: 'makersbnb_test')

  connection.exec("DROP TABLE users, spaces;")

  connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(30), email VARCHAR(30), password VARCHAR(10));")

  connection.exec("CREATE TABLE spaces(id SERIAL PRIMARY KEY, price INTEGER, name VARCHAR(50), description VARCHAR(100), booking BOOLEAN DEFAULT false, owner_id INTEGER REFERENCES users(id));")

end
