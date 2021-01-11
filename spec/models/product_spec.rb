require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
   it 'should create a  product when all validations are true' do
    @category = Category.new(name:"Test")
    @product = Product.new(name:"test", price_cents:2000, quantity: 10, category: @category)
    @product.save!
    expect(@product.errors).not_to include("can\'t be blank")
   end
   it 'should not create a product if name is missing' do
    @category = Category.new(name:"Test")
    @product = Product.new(price_cents:2000, quantity: 10, category: @category)
    @product.save
    expect(@product.errors[:name]).to include("can\'t be blank")
   end
   it 'should not create a product if price is missing' do
    @category = Category.new(name:"Test")
    @product = Product.new(name:'test', quantity: 10, category: @category)
    @product.save
    expect(@product.errors[:price_cents]).to include("is not a number")
   end
   it 'should not create a product if quantity is missing' do
    @category = Category.new(name:"Test")
    @product = Product.new(name:'test', price_cents:2000, category: @category)
    @product.save
    expect(@product.errors[:quantity]).to include("can\'t be blank")
   end
   it 'should not create a product if category is missing' do
    @category = Category.new(name:"Test")
    @product = Product.new(name:'test', price_cents:2000, quantity: 10)
    @product.save
    expect(@product.errors[:category]).to include("can\'t be blank")
   end
  end
end