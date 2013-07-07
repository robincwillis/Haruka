class AddAttachmentPhotoToTerms < ActiveRecord::Migration
  def self.up
    change_table :terms do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :terms, :photo
  end
end
