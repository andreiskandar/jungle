require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @product = Product.new(id: 1, name: 'shoe', price_cents: 15, quantity: 5, category: Category.find_or_create_by(name: "fashion"))
  end

  describe "Validations" do

    # validates :name, presence: true
    it "is not valid without name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end
    
    # validates :price, presence: true
    it "is not valid without price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    # validates :quantity, presence: true
    it "is not valid without quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    # validates :category, presence: true
    it "is not valid without category" do
      @product.category_id = nil
      expect(@product).to_not be_valid
    end

    it "should show errors full_messages when a new product fields are empty" do
      new_product = Product.new      
      new_product.valid?
      expect(new_product.errors.full_messages).to_not be_empty
    end 
  end

end
