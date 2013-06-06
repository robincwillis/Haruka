class CreateVarients < ActiveRecord::Migration
  def change
    create_table :varients do |t|
      t.integer :term_id
      t.integer :term_varient_id

      t.timestamps
    end
  end
end
