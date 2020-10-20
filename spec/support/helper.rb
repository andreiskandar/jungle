def mock_item
    @category = Category.create! name: 'apparel'

    @category.products.create!(
      name: 'Hipster Hat',
      description: 'Heirloom stumptown asymmetrical kombucha. Yolo fanny pack freegan loko roof. Five dollar toast you probably haven\'t heard of them poutine gluten-free. Portland',
      image: open_asset('apparel3.jpg'),
      quantity: 5,
      price: 25
    )
end

def create_mock_user
  @user = User.create!(
    first_name: 'Jack',
    last_name: 'Monroe',
    email: 'mock@USER.COm',
    password: '111111',
    password_confirmation: '111111'
  )
end
