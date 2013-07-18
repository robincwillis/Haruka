# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  author     :string(255)
#  body       :text
#  term_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :term
  belongs_to :user
  attr_accessible :user_id, :body
  validates :body, presence: true, length: {minimum: 5 }
end
