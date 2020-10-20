require 'rails_helper'
require 'capybara/rails'

RSpec.feature "Product Details", type: :feature , js: true do
  
  # invoke helper function to create item
  before :each do 
    mock_item
  end
  
  scenario "User can see product details" do
    
    visit root_path

    find_link('Hipster Hat').click
    
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')
    expect(page).to have_css("img[src*='apparel3.jpg']")
  
    page.save_screenshot

  end
end
