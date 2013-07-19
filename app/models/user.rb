# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :terms, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :phrases, dependent: :destroy
  has_many :flags, as: :flaggable, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_terms, through: :favorites, source: :term

  attr_accessible :email, :name, :password, :password_confirmation
  attr_accessor :accessible
  attr_accessor :updating_password
  attr_accessor :signing_in
  has_secure_password
  acts_as_voter
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, if: :require_password?
  validates :password_confirmation, presence: true, on: :create
  after_validation { self.errors.messages.delete(:password_digest) }

    def send_password_reset
      self.password_reset_token = SecureRandom.urlsafe_base64
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
    end

    def require_password?
      signing_in || new_record?
    end

    private

    def mass_assignment_authorizer(role = :default)
        super(role) + (accessible || [])
    end

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def favorite!(term)
      favorites.create!(term_id:term.id)
    end

    def unfavorite!(term)
      favorites.find_by_term_id(term.id)
    end

end
