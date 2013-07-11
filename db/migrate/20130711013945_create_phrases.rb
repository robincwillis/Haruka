class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.text :english
      t.text :japanese
      t.integer :user_id
      t.integer :term_id

      t.timestamps
    end
  end
end
