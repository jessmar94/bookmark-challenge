feature 'Viewing the list of Bookmarks' do
  scenario 'displays Bookmarks' do
    visit ('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
  end
end
