require 'pg'

class DatabaseConnection

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      @plug = PG.connect(dbname: 'makersbnb_test')
    else
      @plug = PG::Connection.new("ec2-50-16-197-244.compute-1.amazonaws.com", 5432, nil, nil, "d37k5fffpt81gq", "mwtacjgvugnztj", "53332d96369b96d480139e1fd78566a94eb886172ed0ce26bab98bba31067a57")
    end
  end

  def self.query(query)
    @plug.exec(query)
  end

  def self.plug
    @plug
  end

end
