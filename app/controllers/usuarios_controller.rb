# encoding : utf-8
class UsuariosController < ApplicationController

  def home
    if logged_in?
      redirect_to current_user
    else
      @usuario = Usuario.new
    end
  end

  def index
    @usuarios = Usuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios }
    end
  end

  def admin
    @usuario = Usuario.find(params[:id])
    @usuario.administrador = !@usuario.administrador
    if @usuario.save
      redirect_to usuarios_path, notice: "Tipo de conta do usuário #{@usuario.nome} salvo com sucesso."
    else
      redirect_to usuarios_path, :flash[:error] = "Erro ao alterar o tipo de conta do usuário #{@usuario.nome}: #{@usuario.errors}"
    end
  end

  def show
    @usuario = Usuario.find(params[:id])
    if logged_in? && current_user.id == @usuario.id
      @avaliacoes = Avaliacao.where(:usuario_id => @usuario.id)
    else
      @avaliacoes = Avaliacao.moderadas.do_usuario_id(@usuario.id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def cadastro_efetuado

  end

  def create
    if params[:usuario][:email].include? "@"
      if !(params[:usuario][:email].include? "id.uff.br")
        flash[:error] = "Email incorreto. Para se cadastrar no sistema, você precisa informar um email @id.uff.br."
        redirect_to root_url and return
      end
    else
      email = params[:usuario][:email]+ "@id.uff.br"
    end
    if Usuario.where(:email => email).any?
      flash[:error] = "Já existe um cadastro com esse email."
      redirect_to root_url and return
    else
      @usuario = Usuario.new(params[:usuario])
      @usuario.email = email
      @usuario.administrador = 0

      respond_to do |format|
        if @usuario.save
          UserMailer.registration_confirmation(@usuario).deliver
          format.html { redirect_to cadastro_efetuado_usuarios_path, notice: @usuario.email }
        end
      end
    end
  end

  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to @usuario, notice: 'Dados editados com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: "Usuário apagado." }
      format.json { head :no_content }
    end
  end

  def confirm_email
    @usuario = Usuario.find_by_confirm_token(params[:id])
    if @usuario
      @usuario.email_activate
      redirect_to root_path, notice: "Bem vindo(a) ao EstagiandoUFF! Sua conta foi verificada. Por favor, faça login para prosseguir."
    else
      flash[:error] = "Usuário não existente."
      redirect_to root_url
    end
  end
end
