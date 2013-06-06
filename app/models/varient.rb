class Varient < ActiveRecord::Base
 attr_accessible :term_id, :term_varient_id

  belongs_to :term
  belongs_to :term_varient, :class_name => "Term"

end
