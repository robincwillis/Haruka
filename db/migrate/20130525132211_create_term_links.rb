class CreateTermLinks < ActiveRecord::Migration

	def up
		create_table :links, :id => false do |t|
			t.integer :left_term_id
			t.integer :right_term_id
		end
	end

	def down
		drop_table :links
	end


end
