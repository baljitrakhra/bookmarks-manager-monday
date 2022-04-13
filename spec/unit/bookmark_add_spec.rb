require 'bookmark'

describe Bookmark do
  describe 'adding a bookmark' do
    it 'lets you add a new bookmark into the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.add_bookmark(url: 'http://amazon.co.us', title: 'Amazon')
      bookmarks = Bookmark.all
      expect(bookmarks.first.title).to eq 'Amazon'
    end
  end
end