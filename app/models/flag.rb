class Flag < ActiveRecord::Base
  attr_accessible :flaggable_id, :flaggable_type, :reason, :user_id

  belongs_to :flaggable, polymorphic: true

  default_scope order: 'flags.created_at DESC'

end
