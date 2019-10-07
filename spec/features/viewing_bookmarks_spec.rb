feature 'Viewing the list of Bookmarks' do
  scenario 'displays Bookmarks' do
    visit ('/bookmarks')
    expect(page).to have_content 'Bookmark1'
  end
end
