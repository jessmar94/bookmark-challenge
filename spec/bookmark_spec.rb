require "bookmark"

describe Bookmark do

  subject(:bookmark1) { described_class.new }

  describe '#initialize' do
    it "creates a new bookmark instance with a list" do
      expect(bookmark1.list).not_to be_empty
    end
  end

  describe '#all' do

  end
end
