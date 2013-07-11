class AddUserIdToTerms < ActiveRecord::Migration
  def change
  	add_column :terms, :user_id, :integer
  	add_index :terms, :user_id
  end
end
