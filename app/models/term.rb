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

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  # def should_generate_new_friendly_id?
  #   new_record?
  # end

  attr_accessible :def, :desc, :kana, :kanji, :lit, :name, :phonetic

  VALID_NAME_REGEX = /^[a-zA-Z\d\s]*$/
  validates :name, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { maximum: 22 },
                    format: { with: VALID_NAME_REGEX }

  before_save :capitalize_name  

  validates :def, presence: true, length: { maximum: 22 }
  validates :desc, length: { maximum: 500 }
  

  belongs_to :user
  has_many :phrases, dependent: :destroy
  has_many :flags, as: :flaggable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :varients
  has_many :term_varients, :through => :varients
  has_many :inverse_varients, :class_name => "Varient", :foreign_key => "term_varient_id"
  has_many :inverse_term_varients, :through => :inverse_varients, :source => :term
  has_many :favorites, dependent: :destroy

  acts_as_voteable
  #Thumbnail
  attr_accessible :photo

  has_attached_file :photo, :styles => { 
                    :medium => "300x300#", 
                    :thumb => "100x100#" }, 
                    :default_url => "/images/:style/missing.png"

validates_attachment_content_type :photo, :content_type => /^image\/(png|gif|jpeg|jpg)/

validates_attachment_size :photo, :less_than => 2.megabytes

default_scope order('created_at DESC')

  def capitalize_name
    self.name[0] = name.first.capitalize[0]
  end

  def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      find(:all, :conditions => ['name LIKE :search OR kanji LIKE :search OR kana LIKE :search OR def LIKE :search OR phonetic LIKE :search OR lit LIKE :search', {:search => "%#{search}%"}])
	  else
	    find(:all)
	  end
  end

  def favorited?(user)
    favorites.find_by_user_id(user.id)
  end
  
end
