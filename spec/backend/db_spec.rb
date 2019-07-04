require 'db'

describe DatabaseConnection do
  it 'connects' do
    expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
    DatabaseConnection.connect
  end

  it 'queries' do
    con = DatabaseConnection.connect
    expect(con).to receive(:exec).with("SELECT * FROM users;")
    DatabaseConnection.query("SELECT * FROM users;")
  end

  it 'returns plug' do
    con = DatabaseConnection.connect
    expect(DatabaseConnection.plug).to eq(con)
  end
end
