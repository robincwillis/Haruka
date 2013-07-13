class Message < ActiveRecord::Base
  attr_accessible :body, :email, :name, :subject

  validates :name, :email, :subject, :body, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true

end
