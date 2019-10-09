require 'bookmark'
require 'database_helpers_spec'


describe Bookmark do

  describe '.all' do
    it 'returns all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'www.google.com', title: 'Google')
      Bookmark.create(url: 'www.facebook.com', title: 'Facebook')
      Bookmark.create(url: 'www.topshop.com', title: 'Topshop')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'www.google.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.create(url: 'www.facebook.com', title: 'Facebook')

      Bookmark.delete(id: bookmark.id)

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 1
      expect(bookmarks).not_to include("http://www.testbookmark.com")
      expect(bookmarks.first.title).to eq "Facebook"
    end
  end
end
