class Appointment < ApplicationRecord
  belongs_to :user
  enum status: ["Pending", "Approved", "Rejected"]
  # AppointmentJob.perform_later
end
