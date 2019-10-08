require "bookmark"

describe Bookmark do

  describe '.all' do
    it 'returns all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES('www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('www.facebook.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('www.topshop.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('www.google.com')
      expect(bookmarks).to include('www.facebook.com')
      expect(bookmarks).to include('www.topshop.com')
    end
  end
end 
