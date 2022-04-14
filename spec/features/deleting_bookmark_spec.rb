feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.add_bookmark(url: 'http://google.com/', title: 'Google united kingdom')
    visit('/bookmarks')
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google united kingdom', href: 'http://google.com/')
  end
end