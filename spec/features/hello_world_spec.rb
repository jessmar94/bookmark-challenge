feature 'Sinatra testing' do
  scenario 'see Hello world on homepage' do
    visit ('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end
