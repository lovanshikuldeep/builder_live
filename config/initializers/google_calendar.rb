# config/initializers/google_calendar.rb

require 'google/apis/calendar_v3'

Google::Apis::RequestOptions.default.retries = 3

# Set up client using the credentials obtained from the Google Cloud Console
client = Google::Apis::CalendarV3::CalendarService.new
client.client_options.application_name = 'test_project '
client.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
  json_key_io: File.open('/home/developer/Downloads/calendar-api-management-app-b5e2b533add1.json'),
  scope: Google::Apis::CalendarV3::AUTH_CALENDAR
)

GOOGLE_CALENDAR = client
