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

  def show
    @usuario = Usuario.find(params[:id])
    @avaliacoes = Avaliacao.where(:usuario_id => @usuario.id)

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

    @usuario = Usuario.new(params[:usuario])
    @usuario.email = email

    respond_to do |format|
      if @usuario.save
        UserMailer.registration_confirmation(@usuario).deliver
        format.html { redirect_to cadastro_efetuado_usuarios_path, notice: @usuario.email }
      end
    end
  end

  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
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
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  def confirm_email
    @usuario = Usuario.find_by_confirm_token(params[:id])
    if @usuario
      @usuario.email_activate
      redirect_to root_path, notice: "Welcome to the Sample App! Your email has been confirmed. Please sign in to continue."
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end
end
