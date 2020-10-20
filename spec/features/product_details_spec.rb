require 'rails_helper'
require 'capybara/rails'

RSpec.feature "Product Details", type: :feature , js: true do

  before :each do 
    @category = Category.create! name: 'apparel'

    @category.products.create!(
      name: 'Hipster Hat',
      description: 'Heirloom stumptown asymmetrical kombucha. Yolo fanny pack freegan loko roof. Five dollar toast you probably haven\'t heard of them poutine gluten-free. Portland',
      image: open_asset('apparel3.jpg'),
      quantity: 5,
      price: 24.99
    )
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
