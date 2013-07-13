class Favorite < ActiveRecord::Base
  attr_accessible :term_id, :user_id
  belongs_to :user, class_name: "User"
  belongs_to :term, class_name: "Term"

end
