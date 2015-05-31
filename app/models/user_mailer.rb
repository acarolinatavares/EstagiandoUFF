# encoding: utf-8
class UserMailer < ActionMailer::Base
  default :from => "estagiandouff@gmail.com"

  def registration_confirmation(usuario)
    @usuario = usuario
    mail(:to => "#{usuario.nome} <#{usuario.email}>", :subject => "Confirmação de Cadastro")
  end
  
end