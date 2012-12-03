class SessionsController < ApplicationController

  def create
    session[:contact_id] = params[:id]
    redirect_to contacts_path
  end

end
