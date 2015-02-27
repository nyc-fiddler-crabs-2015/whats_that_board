class Timeslot < ActiveRecord::Base
	belongs_to :tutor, :class_name => "User"
	belongs_to :student, :class_name => "User"
	has_one :topic
end
