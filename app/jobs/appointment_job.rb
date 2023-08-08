class AppointmentJob < ApplicationJob
  queue_as :default

  def perform
    pending_appointments = Appointment.where(status: "Pending")
    pending_appointments.each do |appointment|
      if appointment.created_at <= 1.minute.ago
        appointment.update(status: "Rejected")
      end
    end
  end
end
