class Link < ActiveRecord::Base
  belongs_to :left_term, :class_name => :Post
  belongs_to :right_term, :class_name => :Post
end