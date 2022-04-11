require 'bookmark'
describe Bookmark do
  describe '#show the bookmarks' do
    it 'displays the book marks to the users' do
      expect(described_class.all).not_to eq []
    end
  end
end
