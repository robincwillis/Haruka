# == Schema Information
#
# Table name: varients
#
#  id              :integer          not null, primary key
#  term_id         :integer
#  term_varient_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Varient < ActiveRecord::Base
 attr_accessible :term_id, :term_varient_id

  belongs_to :term
  belongs_to :term_varient, :class_name => "Term"

end
