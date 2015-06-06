# encoding : utf-8
class SessionsController < ApplicationController
  before_filter :block_access, except: [:destroy]

  def new

  end

  def create
    @usuario = Usuario.where(:email=> params[:session][:email].downcase).first
    if @usuario && @usuario.senha == params[:session][:senha]
      if @usuario.email_confirmed
        sign_in(@usuario)
        redirect_to usuario_path(@usuario.id)
      else
        redirect_to root_path,  :flash => {:error => "Por favor, ative sua conta seguindo as instruções no e-mail de confirmação de conta que você recebeu para continuar."}
      end
    else
      redirect_to root_path, :flash => { :error => "Email e/ou senha incorretos" }
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
