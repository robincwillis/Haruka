class StaticPagesController < ApplicationController
  def about
  	    @page_title = 'About'
  end

  def contact
  	    @page_title = 'Contact Us'
  end
end