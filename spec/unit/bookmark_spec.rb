require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'displays the book marks to the users' do
     connection = PG.connect(dbname: 'bookmark_manager_test')
     Bookmark.add_bookmark('http://www.makersacademy.com', 'Makers Academy')
     Bookmark.add_bookmark('http://www.destroyallsoftware.com', 'Destroy all')
     Bookmark.add_bookmark('http://www.google.com', 'Google for all')
     
     bookmarks = Bookmark.all
     
     expect(bookmarks[0]).to include "Makers Academy"
     expect(bookmarks[1]).to include "Destroy all"
     expect(bookmarks[2]).to include "Google for all"
    end
  end
end
