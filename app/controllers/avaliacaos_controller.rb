class AvaliacaosController < ApplicationController
  # GET /avaliacaos
  # GET /avaliacaos.json
  def index
    @avaliacaos = Avaliacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @avaliacaos }
    end
  end

  # GET /avaliacaos/1
  # GET /avaliacaos/1.json
  def show
    @avaliacao = Avaliacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avaliacao }
    end
  end

  # GET /avaliacaos/new
  # GET /avaliacaos/new.json
  def new
    @avaliacao = Avaliacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avaliacao }
    end
  end

  # GET /avaliacaos/1/edit
  def edit
    @avaliacao = Avaliacao.find(params[:id])
  end

  # POST /avaliacaos
  # POST /avaliacaos.json
  def create
    @avaliacao = Avaliacao.new(params[:avaliacao])

    respond_to do |format|
      if @avaliacao.save
        format.html { redirect_to @avaliacao, notice: 'Avaliacao was successfully created.' }
        format.json { render json: @avaliacao, status: :created, location: @avaliacao }
      else
        format.html { render action: "new" }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /avaliacaos/1
  # PUT /avaliacaos/1.json
  def update
    @avaliacao = Avaliacao.find(params[:id])

    respond_to do |format|
      if @avaliacao.update_attributes(params[:avaliacao])
        format.html { redirect_to @avaliacao, notice: 'Avaliacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacaos/1
  # DELETE /avaliacaos/1.json
  def destroy
    @avaliacao = Avaliacao.find(params[:id])
    @avaliacao.destroy

    respond_to do |format|
      format.html { redirect_to avaliacaos_url }
      format.json { head :no_content }
    end
  end
end
