require 'rails_helper'

RSpec.feature "Visitor navigates to details of a product page", type: :feature, js: true do
# SETUP
before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end
end

scenario 'to see the details of the product' do
  visit root_path
  save_screenshot('product_details_page.png')
  first('img').click
  expect(page).to have_css '.products-show', count: 1
  save_screenshot('product1_details_page.png')
end

end
