class ReAddUserIdToFlags < ActiveRecord::Migration
  def up
   add_column :flags, :user_id, :integer
  end

  def down
  end
end
