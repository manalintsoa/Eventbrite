class Attendance < ApplicationRecord

  	belongs_to :event
    belongs_to :attendee, class_name: 'User'

    validates :stripe_customer_id, uniqueness: true

    after_create :new_participant_send
    
 	def new_participant_send
    	AttendanceMailer.new_participant_email(self).deliver_now
 	end

end
