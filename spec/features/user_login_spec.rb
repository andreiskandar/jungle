require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do

  before :each do
    create_mock_user
  end

  scenario "User can login" do 
    visit root_path
    find_link('Sign in').click
    fill_in 'sessions_email', with: 'mock@USER.COm'
    fill_in 'sessions_password', with: '111111'
    find_button('Login').click
    expect(page).to have_content('Products')
    expect(page).to have_content('Logout')
  end
end
