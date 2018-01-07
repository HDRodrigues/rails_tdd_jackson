require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  #fixtures :customers

  it 'Create a Customer' do
    customer = create(:customer) #Utilizando factoryBot
    puts customer.email # Utilizando sequence
    expect(customer.full_name).to start_with("Sr.")
  end


  it '#full_name - Sobrescrevendo atributo' do
    customer = create(:user, name: "Jackson Pires") #Utilizando factoryBot
    expect(customer.full_name).to eq("Sr. Jackson Pires")
  end

  it '#Heranca factory' do
    customer = create(:customer_vip)
    expect(customer.vip).to be_truthy
  end

  it 'Usando o attributes_for' do
    attrs= attributes_for(:customer)
    puts attrs
  end

  it 'Atributo transitorio' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end


  #Teste se o customer foi acrescentado em 1
  it {expect{create(:customer)}.to change {Customer.all.size}.by(1) }

  it 'Cliente Masculino' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end


end
