class SituacaoAvaliacaosController < ApplicationController
  # GET /situacao_avaliacaos
  # GET /situacao_avaliacaos.json
  def index
    @situacao_avaliacaos = SituacaoAvaliacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @situacao_avaliacaos }
    end
  end

  # GET /situacao_avaliacaos/1
  # GET /situacao_avaliacaos/1.json
  def show
    @situacao_avaliacao = SituacaoAvaliacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @situacao_avaliacao }
    end
  end

  # GET /situacao_avaliacaos/new
  # GET /situacao_avaliacaos/new.json
  def new
    @situacao_avaliacao = SituacaoAvaliacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @situacao_avaliacao }
    end
  end

  # GET /situacao_avaliacaos/1/edit
  def edit
    @situacao_avaliacao = SituacaoAvaliacao.find(params[:id])
  end

  # POST /situacao_avaliacaos
  # POST /situacao_avaliacaos.json
  def create
    @situacao_avaliacao = SituacaoAvaliacao.new(params[:situacao_avaliacao])

    respond_to do |format|
      if @situacao_avaliacao.save
        format.html { redirect_to @situacao_avaliacao, notice: 'Situacao avaliacao was successfully created.' }
        format.json { render json: @situacao_avaliacao, status: :created, location: @situacao_avaliacao }
      else
        format.html { render action: "new" }
        format.json { render json: @situacao_avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /situacao_avaliacaos/1
  # PUT /situacao_avaliacaos/1.json
  def update
    @situacao_avaliacao = SituacaoAvaliacao.find(params[:id])

    respond_to do |format|
      if @situacao_avaliacao.update_attributes(params[:situacao_avaliacao])
        format.html { redirect_to @situacao_avaliacao, notice: 'Situacao avaliacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @situacao_avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situacao_avaliacaos/1
  # DELETE /situacao_avaliacaos/1.json
  def destroy
    @situacao_avaliacao = SituacaoAvaliacao.find(params[:id])
    @situacao_avaliacao.destroy

    respond_to do |format|
      format.html { redirect_to situacao_avaliacaos_url }
      format.json { head :no_content }
    end
  end
end
