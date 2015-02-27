class CreateFeedbacks < ActiveRecord::Migration
	def change
		create_table :feedbacks do |t|
			t.string :content
			t.references :user
			t.timestamps
		end
	end
end
