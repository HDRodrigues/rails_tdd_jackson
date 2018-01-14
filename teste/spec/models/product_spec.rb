require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Instance Methods' do
    it '#full_description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end

  context 'Validates' do
    it {is_expected.to validate_presence_of(:description)}
    it {is_expected.to validate_presence_of(:price)}
    it {is_expected.to validate_presence_of(:category)}
  end
  
  context 'Associations' do
    it{ should belong_to(:category)}
  end

end
