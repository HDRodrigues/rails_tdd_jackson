require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  it 'Visit the page' do
    visit('customers_path')
    expext(page).to have_current_path(customers_path)
  end
end
