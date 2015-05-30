class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
    if logged_in?
      redirect_to root_path
    end
  end

  def correct_user?
    @usuario = Usuario.find(params[:id])
    if current_user == @usuario
      redirect_to usuarios_path
    end
  end


end
