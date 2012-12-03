class ConnectionsController < ApplicationController

  def index
    if session[:contact_id]
      @connections = @current_user.connections
    else
      head :bad_request
    end
  end

  def create
    if @current_user && params[:id]
      other = Contact.find(params[:id])
      @current_user.connect_to(other)

      redirect_to contacts_path
    else
      head :bad_request
    end
  end

end
