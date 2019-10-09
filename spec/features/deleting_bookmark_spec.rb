feature 'delete bookmark' do
  scenario 'user deletes bookmark by clicking button on bookmark' do
    Bookmark.create(url: "www.google.com", title: "Google")
    visit '/bookmarks'
    expect(page).to have_link("Google", href: "www.google.com")
    click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Google", href: "www.google.com")
  end
end
