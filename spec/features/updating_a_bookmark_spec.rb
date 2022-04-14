feature 'updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.add_bookmark(url: 'http://google.com/', title: 'Google homepage')
    visit('/bookmarks')
    expect(page).to have_content('Google homepage')
    first('.bookmark').click_button 'Edit'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
   
    fill_in('url', with: "http://poople.com")
    fill_in('title', with: "Poople homepage")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link("Poople homepage", href: 'http://poople.com')
  end
end