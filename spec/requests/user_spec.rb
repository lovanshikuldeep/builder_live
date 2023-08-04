require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:user) }
    let(:invalid_attributes) { { name: '', email: '', phone_number: '' } }

    context 'with valid attributes' do
      it 'creates a new user' do
        valid_attributes = FactoryBot.attributes_for(:user)
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)

        expect(response).to have_http_status(:success)
        expect(response.body).to eq(User.last.to_json)
      end
    end

    # context 'with invalid attributes' do
    #   it 'does not create a new user' do
    #     invalid_attributes = { name: '', email: '', phone_number: '' }
    #     expect {
    #       post :create, params: { user: invalid_attributes }
    #     }.not_to change(User, :count)
    #   end

      # it 'returns unprocessable_entity status' do
      #   invalid_attributes = { name: '', email: '', phone_number: '' }
      #   post :create, params: { user: invalid_attributes }
      #   expect(response).to have_http_status(:unprocessable_entity)
      #   expect(response.body).to include('user could not be created')
      # end
    # end

    describe 'GET #show' do
      it 'returns JSON data of a user' do
        # Create a test user using FactoryBot
        user = FactoryBot.create(:user)

        # Simulate a GET request to the show action with the test user's ID
        get :show, params: { id: user.id }

        # Expect the response to have a success status
        expect(response).to have_http_status(:success)

        # Expect the response body to be the JSON representation of the user
        expect(response.body).to eq(user.to_json)
      end
    end
  end
end