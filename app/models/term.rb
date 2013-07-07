# == Schema Information
#
# Table name: terms
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  kanji              :string(255)
#  kana               :string(255)
#  def                :string(255)
#  lit                :string(255)
#  desc               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  phonetic           :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Term < ActiveRecord::Base
  attr_accessible :def, :desc, :kana, :kanji, :lit, :name, :phonetic

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 12 }
  validates :def, presence: true, length: { maximum: 12 }
  validates :desc, length: { maximum: 200 }

  has_many :comments
  has_many :varients
  has_many :term_varients, :through => :varients
  has_many :inverse_varients, :class_name => "Varient", :foreign_key => "term_varient_id"
  has_many :inverse_term_varients, :through => :inverse_varients, :source => :term


  #Thumbnail
  attr_accessible :photo

  has_attached_file :photo, :styles => { 
                    :medium => "300x300#", 
                    :thumb => "100x100#" }, 
                    :default_url => "/images/:style/missing.png"


  def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
  end

end
