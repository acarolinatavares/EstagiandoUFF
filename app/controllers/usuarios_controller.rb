class UsuariosController < ApplicationController

  def home
    @usuario = Usuario.new
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
    @usuario = Usuario.new(params[:usuario])

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
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed. Please sign in to continue."
      redirect_to root_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end
end
