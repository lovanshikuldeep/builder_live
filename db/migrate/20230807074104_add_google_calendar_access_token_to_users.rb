class AddGoogleCalendarAccessTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :google_calendar_access_token, :string
  end
end
