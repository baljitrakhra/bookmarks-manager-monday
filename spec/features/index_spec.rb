require 'pg'

feature 'Index page' do
  scenario 'User receives a greeting on the index page' do
    visit('/')
    expect(page).to have_content 'Hello world!'
  end
end
