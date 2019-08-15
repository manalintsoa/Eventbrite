class AttendanceMailer < ApplicationMailer

	def new_participant_email(attendance)
  		@admin = attendance.event.admin
  		@attendee = attendance.attendee
  		@event = attendance.event

  		mail(to: @admin.email, subject: "#{@attendee.first_name} a rejoint votre événement #{@event.title}")
 	end

end
