require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    order = create(:order)
    puts order.description
    puts order.customer
    puts order.customer.name
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Tem 2 pedidos' do
    orders = create_pair(:order)
    expect(orders.count).to eq(2)
  end
  it 'has_many' do
    # customer =create(:customer, :with_orders) #Utilizando o default da factory
    customer =create(:customer_with_orders) #Utilizando factory with traits
    #customer =create(:customer, :with_orders, qtt_orders: 5) #Sobrescrevendo
    expect(customer.orders.count).to eq(3)
  end
end
