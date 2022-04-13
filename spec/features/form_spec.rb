feature 'form' do
  scenario' page to have text area to add your bookmark' do
    visit('/form') 
    fill_in 'Bookmark', with: 'http://amazon.co.us'
    expect(page).to have_content 'Add new book mark here'
    expect(page).to have_button 'Submit'
  end
end