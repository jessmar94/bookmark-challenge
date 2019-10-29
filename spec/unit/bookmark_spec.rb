require 'bookmark'
require 'database_helpers'

describe Bookmark do

  let(:comment_class) { double(:comment_class) }

  describe '.all' do
    it 'returns all the bookmarks' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      Bookmark.create(url: 'http://www.topshop.com', title: 'Topshop')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'http://www.google.com'
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

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(Bookmark.all).not_to include('not a real bookmark')
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')

      Bookmark.delete(id: bookmark.id)

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 1
      expect(bookmarks).not_to include("http://www.testbookmark.com")
      expect(bookmarks.first.title).to eq "Facebook"
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.bbc.co.uk/news', title: 'BBC News')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'BBC News'
      expect(updated_bookmark.url).to eq 'http://www.bbc.co.uk/news'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'BBC'
      expect(result.url).to eq 'http://www.bbc.co.uk'
    end
  end

  describe '#comments' do
    it 'calls .where on the Comment class' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.comments(comment_class)
    end
    it 'returns a list of comments on the bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      DatabaseConnection.query("INSERT INTO comments (id, text, bookmark_id) VALUES(1, 'Test comment', #{bookmark.id})")
      comment = bookmark.comments.first
      expect(comment['text']).to eq 'Test comment'
    end
  end
end
