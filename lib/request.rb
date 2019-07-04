require_relative './db'

class Request

  attr_reader :id, :user_id, :space_id, :approved

  def initialize(id, user_id, space_id, approved)
    @id = id
    @user_id = user_id
    @space_id = space_id
    @approved = approved
  end

 def self.request_booking(user_id, space_id)
    DatabaseConnection.connect
    result = DatabaseConnection.query("INSERT INTO request (user_id, space_id)
                                        VALUES ('#{user_id}', '#{space_id}')
                                        RETURNING id, user_id, space_id, approved;")
    Request.new(result[0]["id"], result[0]["user_id"], result[0]["space_id"], result[0]["approved"])
 end

  def self.tenant_view_all_requests(user_id)
    DatabaseConnection.connect
    result = DatabaseConnection.query("SELECT * FROM request WHERE user_id = '#{user_id}';")
    result.map { |request|
       Request.new( request["id"], request["user_id"], request["space_id"], request["approved"])
    }
  end

  def self.landlord_view_all_requests(user_id)
    DatabaseConnection.connect
    result = DatabaseConnection.query("SELECT spaces.name, request.approved, users.username
                                        FROM request
                                        JOIN spaces ON request.space_id=spaces.id
                                        JOIN users ON request.user_id=users.id
                                        WHERE spaces.owner_id=#{user_id};")
    # result.map { |request|
    #   Request.new( request[space.name], request[] )
    # p "-----------------------------------------------"
    # p result
    # p result.map |
  end

  def self.approve_request(request_id, space_id)
    DatabaseConnection.connect
    result = DatabaseConnection.query("UPDATE request SET approved = 'true' WHERE id = '#{request_id}'
                                        RETURNING id, user_id, space_id, approved;")
    DatabaseConnection.query("UPDATE spaces SET booking = 'true' WHERE id = '#{space_id}';")
    Request.new(result[0]["id"], result[0]["user_id"], result[0]["space_id"], result[0]["approved"])
  end


end
