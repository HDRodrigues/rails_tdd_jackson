
FactoryBot.define do
  factory :order do
    sequence(:description) {|n| "Pedido numero - #{n} "}
    #association :customer, factory: :customer #Caso precise sobrescrever a fabrica
    customer
  end
end
