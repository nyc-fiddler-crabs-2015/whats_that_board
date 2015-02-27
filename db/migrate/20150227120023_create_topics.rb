class CreateTopics < ActiveRecord::Migration
  def change
  	create_table :topics do |t|
  		t.string :category
  		t.string :title
  		t.timestamps
  	end
  end
end
