class CreateTimeslots < ActiveRecord::Migration
	def change
		create_table :timeslots do |t|
			t.string :time
			t.references :student
			t.references :tutor
			t.references :topic
			t.timestamps
		end
	end
end
