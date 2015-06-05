# encoding : utf-8
class AvaliacoesController < ApplicationController
  load_and_authorize_resource :except => [:index, :show]

  def index
    @avaliacoes = Avaliacao.all
  end

  def show
    @avaliacao = Avaliacao.find(params[:id])
  end

  def new
    @avaliacao = Avaliacao.new
  end

  def edit
    @avaliacao = Avaliacao.find(params[:id])
  end

  def create
    @avaliacao = Avaliacao.new(params[:avaliacao])
    @avaliacao.usuario_id = current_user.id

    if @avaliacao.save
      redirect_to @avaliacao, :notice => 'Avaliação cadastrada com sucesso!'
    else
      render new_avaliacao_path, :flash => { :error => "A avaliação não pode ser salva. Erros: #{@avaliacao.errors}." }
    end
  end

  def update
    @avaliacao = Avaliacao.find(params[:id])
    @avaliacao.usuario_id = current_user.id

      if @avaliacao.update_attributes(params[:avaliacao])
        redirect_to @avaliacao, :notice => 'Avaliação atualizada com sucesso!.'
      else
        render edit_avaliacao_path, :flash => { :error => "A avaliação não pode ser alterada. Erros: #{@avaliacao.errors}." }
      end
  end

  def destroy
    @avaliacao = Avaliacao.find(params[:id])
    @avaliacao.destroy

    redirect_to root_path, :notice => 'Avaliação apagada com sucesso!.'
  end

  def autocomplete_empresas
    lista = []
    if params[:q].size >= 3
      empresas = Empresa.empresas_tokeninput(params[:q])
      empresas.each do |empresa|
        nome = empresa.nome
        lista.push :id => empresa.id,
                   :name => nome,
                   :img_src => nil
      end
    end
    respond_to do |format|
      format.json { render :json => lista }
    end
  end
end
