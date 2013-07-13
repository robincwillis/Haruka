class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  include SessionsHelper
  include TermsHelper
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

end
