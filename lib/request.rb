require 'db'

class Request

  attr_reader :id, :user_id, :space_id

  def initialize(id, user_id, space_id)
    @id = id
    @user_id = user_id
    @space_id = space_id
  end

 def self.request_booking(user_id, space_id)
    DatabaseConnection.connect
    result = DatabaseConnection.query("INSERT INTO request (user_id, space_id)
                                        VALUES ('#{user_id}', '#{space_id}')
                                        RETURNING user_id, space_id;")
    Request.new(result[0]["id"], result[0]["user_id"], result[0]["space_id"])
 end

end
