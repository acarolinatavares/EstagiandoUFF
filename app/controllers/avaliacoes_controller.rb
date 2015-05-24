class AvaliacoesController < ApplicationController
  # GET /avaliacoes
  # GET /avaliacoes.json
  def index
    @avaliacoes = Avaliacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @avaliacoes }
    end
  end

  # GET /avaliacoes/1
  # GET /avaliacoes/1.json
  def show
    @avaliacao = Avaliacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avaliacao }
    end
  end

  # GET /avaliacoes/new
  # GET /avaliacoes/new.json
  def new
    @avaliacao = Avaliacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avaliacao }
    end
  end

  # GET /avaliacoes/1/edit
  def edit
    @avaliacao = Avaliacao.find(params[:id])
  end

  # POST /avaliacoes
  # POST /avaliacoes.json
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

  # PUT /avaliacoes/1
  # PUT /avaliacoes/1.json
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

  # DELETE /avaliacoes/1
  # DELETE /avaliacoes/1.json
  def destroy
    @avaliacao = Avaliacao.find(params[:id])
    @avaliacao.destroy

    respond_to do |format|
      format.html { redirect_to avaliacoes_url }
      format.json { head :no_content }
    end
  end
end
