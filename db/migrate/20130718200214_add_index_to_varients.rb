class AddIndexToVarients < ActiveRecord::Migration
  def change

	add_index :varients, :term_id
    add_index :varients, :term_varient_id
    add_index :varients, [:term_varient_id, :term_id], unique: true

  end
end
