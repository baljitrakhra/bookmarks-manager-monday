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
  describe '.update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.add_bookmark(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')
  
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end
  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.add_bookmark(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end
end
