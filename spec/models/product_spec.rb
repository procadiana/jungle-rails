require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid with a name" do
      @category = Category.new
      product = Product.new(
        category: @category,
        name: "Super sofa",
        price: 100,
        quantity: 2
      )

      expect(product).to be_valid
    end


    it "is not valid without a name" do
      @category = Category.new
      product = Product.new(
          category: @category,
          name: nil,
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a price" do
      @category = Category.new
      product = Product.new(
        category: @category,
        name: "Super sofa",
        price: nil
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid without a quantity" do
      @category = Category.new
      product = Product.new(
        category: @category,
        name: "Super sofa",
        price: 100,
        quantity: nil

      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without a category" do
      @category = Category.new
      product = Product.new(
        category: @category,
        name: "Super sofa",
        price: 100,
        quantity: 2,
        category: nil
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end


