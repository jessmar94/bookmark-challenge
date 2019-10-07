require "bookmark"

describe Bookmark do

  describe '.all' do
    it 'returns all the bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("Bookmark1")
      expect(bookmarks).to include("Bookmark2")
    end
  end
end
