class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_current_user

  def get_current_user
    if session[:contact_id].present?
      @current_user = Contact.find(session[:contact_id])
    end
  end
end
