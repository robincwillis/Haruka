class AddSlugToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :slug, :string
    add_index :terms, :slug
  end
end
