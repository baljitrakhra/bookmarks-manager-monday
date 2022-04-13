require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'displays the book marks to the users' do
     connection = PG.connect(dbname: 'bookmark_manager_test')
     Bookmark.add_bookmark(url: 'http://www.makersacademy.com', title: 'Makers Academy')
     
     bookmarks = Bookmark.all
     
     expect(bookmarks['url']).to eq 'http://www.makersacademy.com'
     expect(bookmarks['title']).to eq 'Makers Academy'
    end
  end
end
