# encoding : utf-8
class ComentariosController < ApplicationController
  load_and_authorize_resource :except => [:index, :show]

  def index
    @comentarios = Comentario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comentarios }
    end
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.json
  def new
    @comentario = Comentario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/1/edit
  def edit
    @comentario = Comentario.find(params[:id])
  end

  def create
    @comentario = Comentario.new(params[:comentario])
    @comentario.usuario_id = current_user.id

      if @comentario.save
        redirect_to avaliacao_path(@comentario.avaliacao_id), :flash => { :notice => 'Comentário postado com sucesso!.' }
      else
        redirect_to :back, :flash => { :error => 'Erro ao postar comentário.' }
      end

  end

  # PUT /comentarios/1
  # PUT /comentarios/1.json
  def update
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        format.html { redirect_to @comentario, notice: 'Comentario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario = Comentario.find(params[:id])
    @avaliacao_id = @comentario.avaliacao_id
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to avaliacao_path(@avaliacao_id) }
      format.json { head :no_content }
    end
  end
end
