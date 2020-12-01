class ReminderMailer < ApplicationMailer
	#Remainder mail for Appointment to patient
	def send_reminder(patient)
    @patient = patient
		mail(to: patient.email, subject: 'Reminder of your appointment')
	end
end
