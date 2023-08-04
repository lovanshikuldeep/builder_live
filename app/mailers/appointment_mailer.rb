class AppointmentMailer < ApplicationMailer
  def appointment_created(appointment)
    @appointment = appointment
    mail(to: @appointment.user.email, subject: 'Appointment Created', from: "kuldeeplovanshi777@gmail.com")
  end
end
