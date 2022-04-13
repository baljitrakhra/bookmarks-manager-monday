feature 'form' do
  scenario' page to have text area to add your bookmark' do
    visit('/form') 
    fill_in 'bname', with: 'http://amazon.co.us'
    fill_in 'title', with: 'Amazon'
    expect(page).to have_content 'Add new bookmark url and title here'
    expect(page).to have_button 'Submit'
  end
end