require 'comment'
require 'bookmark'

require 'database_helpers'

describe Comment do

  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      comment = Comment.create(text: 'Test comment', bookmark_id: bookmark.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'Test comment'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the database' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      Comment.create(text: 'Test comment', bookmark_id: bookmark.id)
      Comment.create(text: 'Test comment 2', bookmark_id: bookmark.id)

      comment = Comment.where(bookmark_id: bookmark.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'Test comment'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end
