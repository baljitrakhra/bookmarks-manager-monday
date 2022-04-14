require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'displays the book marks to the users' do
     Bookmark.add_bookmark(url: 'http://www.makersacademy.com', title: 'Makers Academy')
     
     bookmarks = Bookmark.all
     
     expect(bookmarks.length).to eq 1
     expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
     expect(bookmarks.first.title).to eq "Makers Academy"
    end
  end
  describe 'adding a bookmark' do
    it 'lets you add a new bookmark into the database' do
      Bookmark.add_bookmark(url: 'http://amazon.co.us', title: 'Amazon')
      bookmarks = Bookmark.all
      expect(bookmarks.first.title).to eq 'Amazon'
    end
  end
  describe 'deleteing a bookmark' do
    it 'lets user to delete a bookmark from the databse' do
      bookmark = Bookmark.add_bookmark(url: 'http://amazon.co.us', title: 'Amazon')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
      expect(Bookmark.all).to eq []
    end
  end
end
