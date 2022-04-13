feature 'form' do
  scenario' page to have text area to add your bookmark' do
    visit('/form') 
    fill_in 'bname', with: 'http://amazon.co.us'
    fill_in 'title', with: 'Amazon'
    click_button 'Submit'
    expect(page).to have_content 'Amazon'
  end
end  