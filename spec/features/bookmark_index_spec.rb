require 'pg'

feature 'bookmark' do
  scenario 'user can view the list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    Bookmark.add_bookmark(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.add_bookmark(url: 'http://www.destroyallsoftware.com', title: 'Destroy all')
    # Bookmark.add_bookmark(url: 'http://www.google.com', title: 'Google for all')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy all', href: 'http://www.destroyallsoftware.com')
  end

  scenario 'page will have a button to add a new bookmark' do
    visit('/bookmarks')
    expect(page).to have_button("Add-bookmark")
  end
end
