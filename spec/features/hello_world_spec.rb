feature 'Sinatra testing' do
  scenario 'see bookmark manager title on homepage' do
    visit ('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end
