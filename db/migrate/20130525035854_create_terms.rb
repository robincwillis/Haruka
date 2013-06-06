class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :name
      t.string :kanji
      t.string :kana
      t.string :def
      t.string :lit
      t.string :desc

      t.timestamps
    end
  end
end
