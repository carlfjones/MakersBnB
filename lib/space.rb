require 'pg'

class Space

  def self.create(owner_id:, name:, description:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      plug = PG.connect(dbname: 'makersbnb_test')
    else
      plug = PG.connect(dbname: 'makersbnb')
    end
    result = plug.exec("INSERT INTO spaces (owner_id, name, description, price) VALUES
    ('#{owner_id}', '#{name}', '#{description}', '#{price}')
    RETURNING id, owner_id, name, description, price, booking;")
    Space.new(id: result[0]['id'], owner_id: result[0]['owner_id'], name: result[0]['name'],
      description: result[0]['description'], price: result[0]['price'], booking: result[0]['booking'])
    end

    def self.find(id:)
      if ENV['ENVIRONMENT'] == 'test'
        plug = PG.connect(dbname: 'makersbnb_test')
      else
        plug = PG.connect(dbname: 'makersbnb')
      end
    result = plug.exec("SELECT * FROM spaces WHERE id = '#{id}';")
    Space.new(
      id: result[0]['id'],
      owner_id: result[0]['owner_id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      booking: result[0]['booking'],
      )
    end

    def initialize(id:, owner_id:, name:, description:, price:, booking:)
      @id = id
      @owner_id = owner_id
      @name = name
      @description = description
      @price = price
      @booking = booking
    end

    attr_reader :id, :owner_id, :name, :description, :price, :booking
  end
