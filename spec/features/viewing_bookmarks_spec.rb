#require 'pg' - not needed as spec_helper is requiring setup_test_database, which requires pg ? 

feature 'Viewing Bookmarks' do
  scenario 'User can see all bookmarks' do

    Bookmark.create(url: 'www.google.com')
    Bookmark.create(url: 'www.facebook.com')
    Bookmark.create(url: 'www.topshop.com')

    visit ('/bookmarks')

    expect(page).to have_content('www.google.com')
    expect(page).to have_content('www.facebook.com')
    expect(page).to have_content('www.topshop.com')
  end
end
