require 'bookmark'

describe Bookmark do
  describe 'adding a bookmark' do
    it 'lets you add a new bookmark into the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.add_bookmark('http://amazon.co.us')
      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://amazon.co.us"
    end
  end
end