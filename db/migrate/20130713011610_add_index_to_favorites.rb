class AddIndexToFavorites < ActiveRecord::Migration
  def change

  	add_index :favorites, :term_id
    add_index :favorites, :user_id
    add_index :favorites, [:user_id, :term_id], unique: true

  end
end
