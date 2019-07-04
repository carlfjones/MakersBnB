require_relative './db'

class Space

  def self.create(owner_id:, name:, description:, price:)
    DatabaseConnection.connect
    result = DatabaseConnection.query("INSERT INTO spaces (owner_id, name, description, price) VALUES
    ('#{owner_id}', '#{name}', '#{description}', #{price.to_i})
    RETURNING id, owner_id, name, description, price, booking;")
    Space.new(id: result[0]['id'], owner_id: result[0]['owner_id'], name: result[0]['name'],
      description: result[0]['description'], price: result[0]['price'], booking: result[0]['booking'])
    end

    def self.find(id:)
      DatabaseConnection.connect
      result = DatabaseConnection.query("SELECT * FROM spaces WHERE id = '#{id}';")
      Space.new(
        id: result[0]['id'],
        owner_id: result[0]['owner_id'],
        name: result[0]['name'],
        description: result[0]['description'],
        price: result[0]['price'],
        booking: result[0]['booking'],
        )
      end

      def self.viewall
        result = DatabaseConnection.connect.query("SELECT * FROM spaces WHERE booking = 'false';")
        result.map { |listing|
        Space.new(id: listing['id'], owner_id: listing['owner_id'], name: listing['name'],
          description: listing['description'], price: listing['price'], booking: listing['booking'])
        }
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
