feature 'bookmark' do
  scenario 'user can view the list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end
