require 'pg'

feature 'bookmark' do
  scenario 'user can view the list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    
    Bookmark.add_bookmark(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.add_bookmark(url: 'http://www.destroyallsoftware.com', title: 'Destroy all')
    
    visit('/bookmarks')
    expect(page).to have_content 'Makers Academy'
    
  end

  scenario 'page will have a button to add a new bookmark' do
    visit('/bookmarks')
    expect(page).to have_button("Add-bookmark")
  end
end
