require 'pg' # - not needed as spec_helper is requiring setup_test_database, which requires pg ?

feature 'Viewing Bookmarks' do
  scenario 'User can see all bookmarks' do

    Bookmark.create(url: 'www.google.com', title: 'Google')
    Bookmark.create(url: 'www.facebook.com', title: 'Facebook')
    Bookmark.create(url: 'www.topshop.com', title: 'Topshop')

    visit ('/bookmarks')

    expect(page).to have_link('Google', href: 'www.google.com')
    expect(page).to have_link('Facebook', href: 'www.facebook.com')
    expect(page).to have_link('Topshop', href: 'www.topshop.com')
  end
end
