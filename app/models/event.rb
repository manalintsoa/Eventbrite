class Event < ApplicationRecord
	has_many :attendances
	has_many :attendees, through: :attendances
	belongs_to :admin, class_name: 'User'

	validates :start_date, presence: true
	validates :duration, presence: true 
	validates :title, presence: true, length: {in: 50..140 }
	validates :description, presence: true, length: {in: 20..1000 }
	validates :price, presence: true, numericality: { only_integer: true, greater_than: 1, less_than: 1000 }
	validates :location, presence: true

end