require 'bookmark'
describe Bookmark do
  describe '#show the bookmarks' do
    it 'displays the book marks to the users' do
      expect { subject.all }.not_to raise_error
    end
  end
end
