class AddPhoneticsToTerm < ActiveRecord::Migration
  def change
    add_column :terms, :phonetic, :string
  end
end
