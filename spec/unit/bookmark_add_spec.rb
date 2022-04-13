require 'bookmark'

describe Bookmark do
  describe 'adding a bookmark' do
    it 'lets you add a new bookmark into the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.add_bookmark('http://amazon.co.us', 'Amazon')
      bookmarks = Bookmark.all
      expect(bookmarks).to include 'Amazon'
    end
  end
end