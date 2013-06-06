class Comment < ActiveRecord::Base
  belongs_to :term
  attr_accessible :author, :body
end
