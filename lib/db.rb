require 'pg'

class DatabaseConnection

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      @plug = PG.connect(dbname: 'makersbnb_test')
    else
      @plug = PG.connect(dbname: 'makersbnb')
    end
  end

  def self.query(query)
    @plug.exec(query)
  end

  def self.plug
    @plug
  end

end