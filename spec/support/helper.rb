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
