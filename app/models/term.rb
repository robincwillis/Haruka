class Term < ActiveRecord::Base
  attr_accessible :def, :desc, :kana, :kanji, :lit, :name, :phonetic

  validates :name, :presence => true, :uniqueness => true
  validates :def, :presence => true

  has_many :comments

  has_many :varients
  has_many :term_varients, :through => :varients

  has_many :inverse_varients, :class_name => "Varient", :foreign_key => "term_varient_id"
  has_many :inverse_term_varients, :through => :inverse_varients, :source => :term

end
