class AppointmentsController < ApplicationController
 before_action :find_user
 
  def index
    @appointments = @user.appointments
    render json: @appointments
  end 

  def show
    @appointment = @user.appointments.find(params[:id])
  end

  def create
    @appointment = @user.appointments.create(appointment_params)
    if @appointment.save
      # AppointmentMailer.appointment_created(@appointment).deliver_now
      google_calendar(@appointment)
      render json: @appointment
    else
      render json: { errors: 'appointment could not be created'}
    end
  end

  private 

  def appointment_params
    params.require(:appointment).permit(:date, :slote_time, :pickup_location, :user_id, :full_name, :phone_number, :cab_service)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def google_calendar(appointment)
    client = Google::Apis::CalendarV3::CalendarService.new
    client.authorization = google_api_credentials 

    event = Google::Apis::CalendarV3::Event.new(
      summary: "Appointment with #{appointment.full_name}",
      location: appointment.pickup_location,
      description: "Cab service: #{appointment.cab_service}",
      start: {
        date_time: appointment.date.to_datetime.rfc3339,
        time_zone: 'YOUR_TIME_ZONE' 
      },
      end: {
        date_time: (appointment.date + appointment.slote_time.to_i.minutes).to_datetime.rfc3339,
        time_zone: 'YOUR_TIME_ZONE'
      }
    )

    calendar_id = 'primary' 
    result = client.insert_event(calendar_id, event)
    puts "Event created: #{result.html_link}"
  # rescue Google::Apis::AuthorizationError => e
  #   puts "Google API Authorization Error: #{e.message}"
  end

  def google_api_credentials
    client_id = ENV['GOOGLE_CLIENT_ID']
    client_secret = ENV['GOOGLE_CLIENT_SECRET']
    redirect_uri = 'http://localhost:3000/auth/google_oauth2/callback'
  end
end
