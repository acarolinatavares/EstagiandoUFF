class SituacaoAvaliacoesController < ApplicationController
  # GET /situacao_avaliacoes
  # GET /situacao_avaliacoes.json
  def index
    @situacao_avaliacoes = SituacaoAvaliacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @situacao_avaliacoes }
    end
  end

  # GET /situacao_avaliacoes/1
  # GET /situacao_avaliacoes/1.json
  def show
    @situacao_avaliacao = SituacaoAvaliacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @situacao_avaliacao }
    end
  end

  # GET /situacao_avaliacoes/new
  # GET /situacao_avaliacoes/new.json
  def new
    @situacao_avaliacao = SituacaoAvaliacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @situacao_avaliacao }
    end
  end

  # GET /situacao_avaliacoes/1/edit
  def edit
    @situacao_avaliacao = SituacaoAvaliacao.find(params[:id])
  end

  # POST /situacao_avaliacoes
  # POST /situacao_avaliacoes.json
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

  # PUT /situacao_avaliacoes/1
  # PUT /situacao_avaliacoes/1.json
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

  # DELETE /situacao_avaliacoes/1
  # DELETE /situacao_avaliacoes/1.json
  def destroy
    @situacao_avaliacao = SituacaoAvaliacao.find(params[:id])
    @situacao_avaliacao.destroy

    respond_to do |format|
      format.html { redirect_to situacao_avaliacoes_url }
      format.json { head :no_content }
    end
  end
end
