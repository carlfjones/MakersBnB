require 'db'

class Request

  attr_reader :id, :user_id, :space_id, :approve

  def initialize(id, user_id, space_id, approve)
    @id = id
    @user_id = user_id
    @space_id = space_id
    @approve = approve
  end

 def self.request_booking(user_id, space_id)
    DatabaseConnection.connect
    result = DatabaseConnection.query("INSERT INTO request (user_id, space_id)
                                        VALUES ('#{user_id}', '#{space_id}')
                                        RETURNING user_id, space_id;")
    Request.new(result[0]["id"], result[0]["user_id"], result[0]["space_id"], result[0]["approve"])
 end

  def self.view_all_requests(space_id)
    DatabaseConnection.connect
    result = DatabaseConnection.query("SELECT * FROM request WHERE space_id = '#{space_id}';")
    result.map { |request|
       Request.new( request["id"], request["user_id"], request["space_id"], request["approve"])
    }
  end

  def self.approve_request(request_id, space_id)
    DatabaseConnection.connect
    result = DatabaseConnection.query("UPDATE request SET approved = 'true' WHERE id = '#{request_id}'
                                        RETURNING id, user_id, space_id, approved;")
    DatabaseConnection.query("UPDATE spaces SET booking = 'true' WHERE id = '#{space_id}';")
    Request.new(result[0]["id"], result[0]["user_id"], result[0]["space_id"], result[0]["approved"])
  end


end
