require 'database_connection'

describe DatabaseConnection do
  
  context 'creates connection ' do
    it 'to the database through PG' do 
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
    it 'check that the connection is persistant' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it'lets user to send sql query' do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM bookmarks;",[])

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end