require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  describe 'GET #index' do
    it 'returns JSON data of user appointments' do
      user = FactoryBot.create(:user)
      appointment1 = FactoryBot.create(:appointment, user: user)
      appointment2 = FactoryBot.create(:appointment, user: user)

      get :index, params: { user_id: user.id }

      expect(response).to have_http_status(:success)

      response_data = JSON.parse(response.body)
      expect(response_data).to match_array([
        appointment1.as_json,
        appointment2.as_json
      ])
    end

    it 'returns empty JSON if user has no appointments' do
      user = FactoryBot.create(:user)

      get :index, params: { user_id: user.id }

      expect(response).to have_http_status(:success)

      response_data = JSON.parse(response.body)
      expect(response_data).to eq([])
    end
  end

  describe 'POST #create' do
  it 'creates a new appointment and sends an email' do
    user = FactoryBot.create(:user)

    allow(AppointmentMailer).to receive(:appointment_created).and_return(double(deliver_now: true))

 
    valid_params = FactoryBot.attributes_for(:appointment)
    post :create, params: { user_id: user.id, appointment: valid_params }

    expect(response).to have_http_status(:success)

    response_data = JSON.parse(response.body)
    expect(response_data['date']).to eq(valid_params[:date].to_s)
    expect(response_data['slote_time']).to eq(valid_params[:slote_time])
    expect(response_data['pickup_location']).to eq(valid_params[:pickup_location])
    expect(response_data['full_name']).to eq(valid_params[:full_name])
    expect(response_data['phone_number']).to eq(valid_params[:phone_number])
    expect(response_data['cab_service']).to eq(valid_params[:cab_service])
    expect(AppointmentMailer).to have_received(:appointment_created).with(kind_of(Appointment))
  end
  end
end
