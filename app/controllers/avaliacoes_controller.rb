class AvaliacoesController < ApplicationController

  def index
    @avaliacoes = Avaliacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @avaliacoes }
    end
  end

  def show
    @avaliacao = Avaliacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avaliacao }
    end
  end

  def new
    @avaliacao = Avaliacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avaliacao }
    end
  end

  def edit
    @avaliacao = Avaliacao.find(params[:id])
  end

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

  def destroy
    @avaliacao = Avaliacao.find(params[:id])
    @avaliacao.destroy

    respond_to do |format|
      format.html { redirect_to avaliacoes_url }
      format.json { head :no_content }
    end
  end

  def autocomplete_empresas
    lista = []
    if params[:q].size >= 3
      empresas = Usuario.empresas_tokeninput(params[:q])
      empresas.each do |empresa|
        nome = empresa.nome
        lista.push :id => empresa.id,
                   :name => nome.truncate(30),
                   :img_src => nil
      end
    end
    respond_to do |format|
      format.json { render :json => lista }
    end
  end
end
