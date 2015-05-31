class SessionsController < ApplicationController
  before_filter :block_access, except: [:destroy]

  def new

  end

  def create
    @usuario = Usuario.where(:email=> params[:session][:email].downcase).first
    if @usuario && @usuario.senha == params[:session][:senha]
      if @usuario.email_confirmed
        sign_in(@usuario)
        redirect_to current_user
      else
        flash.now[:error] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        redirect_to root_path
      end
    else
      flash.now[:error] = 'Email e/ou senha incorretos.'
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
