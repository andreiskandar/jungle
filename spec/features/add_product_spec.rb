require 'rails_helper'
require 'capybara/rails'

RSpec.feature "Visitor can add product", type: :feature, js: true do

  before(:each) do
    @category = Category.create! name: "Apparel"

    @category.products.create!(
      name:  'Red Bookshelf',
      description: Faker::Hipster.paragraph(4),
      image: open_asset('furniture1.jpg'),
      quantity: 10, 
      price: 64.99
    )

  end  

  scenario "A user can add a product to their cart when not logged in" do 
    # visit the home page
    visit root_path

    # find a product listing
    # click add button on that product listing
    first('article.product').find_button('Add').click
    
    # check if nav has item in cart
    # click the cart link
    find_link('My Cart (1)').click

    # check that item exists in the cart
    expect(page).to have_content("TOTAL:")
    expect(page).to have_content("Red Bookshelf")

    page.save_screenshot

  
  end

end


