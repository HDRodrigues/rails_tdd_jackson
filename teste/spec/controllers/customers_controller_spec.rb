require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
    describe 'as a Guest Member' do
        context '#index' do
            it 'Responde successfully' do
                get :index
                expect(response).to be_success
            end
            
            it 'Responde 200' do
                get :index
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'as a Logged Member' do
        context '#show' do
            before do
                @member = create(:member)
                @customer = create(:customer)
            end
            
            it 'Flash Notice' do
                customer_params = attributes_for(:customer)
                sign_in @member
                post :create, params: {customer: customer_params}
                expect(flash[:notice]).to match(/successfully created/)
            end


            it 'with valid attributes' do
                customer_params = attributes_for(:customer)
                sign_in @member
                expect{
                    post :create, params:{customer:customer_params}
                }.to change(Customer,:count).by(1)
            end

            it '#show - 302 (not authorized)' do
                get :show, params: {id: @customer.id}
                expect(response).to have_http_status(302)
            end
            
            it '#show - 200 authorized' do
                sign_in @member
                get :show , params: { id: @customer.id}
                expect(response).to have_http_status(200)
            end

            it '#show - render template' do
                sign_in @member
                get :show , params: { id: @customer.id}
                expect(response).to render_template(:show)
            end


            it 'Content-Type' do
                customer_params = attributes_for(:customer)
                sign_in @member
                post :create,format: :json, params: {customer: customer_params}
                expect(response.content_type).to eq('application/json')
            end
        end
    end

end
