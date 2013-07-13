class RemoveUserIdFromFlags < ActiveRecord::Migration
  def up

  	remove_column :flags, :user_id

  end

  def down
  end
end
