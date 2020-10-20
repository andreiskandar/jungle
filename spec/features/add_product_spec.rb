require 'rails_helper'

RSpec.feature "AddProducts", type: :feature, js:true do

  before :each do
    @category = Category.create! name: 'furniture'
    @category.products.create!(
      name: 'Electric Chair',
      description: 'Shabby chic fixie pabst 90\'s wayfarers typewriter distillery. Leggings skateboard diy jean shorts fixie. Lumbersexual hashtag taxidermy tacos. Lomo messenger bag yr williamsburg bitters locavore meditation. Hammock williamsburg vice ugh.',
      price: 500,
      quantity: 2,
      image: open_asset('furniture1.jpg')
    )
  end

    scenario 'User can add item to cart and see number of item increases by 1 in the cart' do
      visit root_path

      find_button('Add').click

      find_link('My Cart (1)').click

      find_button('+').click

      expect(page).to have_content('TOTAL:')
      expect(page).to have_content('2')
      expect(page).to have_content('$1,000')

      page.save_screenshot
    end
end
