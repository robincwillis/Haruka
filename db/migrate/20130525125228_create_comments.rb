class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.references :term

      t.timestamps
    end
    add_index :comments, :term_id
  end
end
