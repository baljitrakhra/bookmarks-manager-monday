require 'pg'

feature 'bookmark' do
  scenario 'user can view the list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    Bookmark.add_bookmark('http://www.makersacademy.com', 'Makers Acadmey')
    Bookmark.add_bookmark('http://www.destroyallsoftware.com', 'Destroy all')
    Bookmark.add_bookmark('http://www.google.com', 'Google for all')
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

  scenario 'page will have a button to add a new bookmark' do
    visit('/bookmarks')
    expect(page).to have_button("Add-bookmark")
  end
end
