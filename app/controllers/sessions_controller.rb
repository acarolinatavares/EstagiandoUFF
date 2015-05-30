class SessionsController < ApplicationController
  before_filter :block_access, except: [:destroy]

  def new

  end

  def create
    @usuario = Usuario.where(:email=> params[:session][:email].downcase).first
    if @usuario && @usuario.senha == params[:session][:senha]
      sign_in(@usuario)
      redirect_to current_user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
