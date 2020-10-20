require 'rails_helper'

RSpec.feature "AddProducts", type: :feature, js:true do

  # invoke helper function to mock_item
  before :each do
    mock_item
  end

    scenario 'User can add item to cart and see number of item increases by 1 in the cart' do
      visit root_path

      find_button('Add').click

      find_link('My Cart (1)').click

      find_button('+').click

      expect(page).to have_content('TOTAL:')
      expect(page).to have_content('2')
      expect(page).to have_content('$50')

      page.save_screenshot
    end
end
