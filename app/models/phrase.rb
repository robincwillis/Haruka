class Phrase < ActiveRecord::Base
	belongs_to :term
	belongs_to :user
  	attr_accessible :english, :japanese, :term_id, :user_id

  	validates :english, presence: true, length: { minimum: 10 }
  	validates :japanese, presence: true, length: { minimum: 10 }

end
