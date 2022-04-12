require 'bookmark'
describe Bookmark do
  describe '#show the bookmarks' do
    it 'displays the book marks to the users' do
     bookmarks = Bookmark.all
     expect(bookmarks).to include "http://www.makersacademy.com/"
     expect(bookmarks).to include "http://www.destroyallsoftware.com"
     expect(bookmarks).to include "http://www.google.com/"
    end
  end
end
