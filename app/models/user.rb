class User < ActiveRecord::Base
	has_secure_password
	has_many :feedbacks
      has_many :student_timeslots, foreign_key: "student_id", class_name: "Timeslot"
      has_many :tutor_timeslots, foreign_key: "tutor_id", class_name: "Timeslot"
end
