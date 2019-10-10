feature 'Update bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'https://www.bbc.co.uk', title: 'BBC')
    visit ('/bookmarks')
    expect(page).to have_link('BBC', href: 'https://www.bbc.co.uk')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "https://www.bbc.co.uk/news")
    fill_in('title', with: "BBC News")
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('BBC', href: 'https://www.bbc.co.uk')
    expect(page).to have_link('BBC News', href: 'https://www.bbc.co.uk/news')
  end
end
