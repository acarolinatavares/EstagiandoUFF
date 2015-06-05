# encoding : utf-8
class EmpresasController < ApplicationController
  load_and_authorize_resource :except => [:index, :show]

  def index
    @empresas = Empresa.all
  end

  def show
    @empresa = Empresa.find(params[:id])
  end

  def new
    @empresa = Empresa.new
  end

  def edit
    @empresa = Empresa.find(params[:id])
  end

  def create
    @empresa = Empresa.new(params[:empresa])

    if @empresa.save
      redirect_to @empresa, :flash => {:notice => 'Empresa cadastrada com sucesso.'}
    else
      render new_empresa_path, :flash => {:error => "A empresa não pode ser cadastrada. Erro(s): #{@empresa.errors}"}
    end
  end

  def update
    @empresa = Empresa.find(params[:id])

    if @empresa.update_attributes(params[:empresa])
      redirect_to @empresa, :flash => {:notice => 'Empresa atualizada com sucesso.'}
    else
      render edit_empresa_path, :flash => {:error => "A empresa não pode ser alterada. Erro(s): #{@empresa.errors}"}
    end
  end

  def destroy
    @empresa = Empresa.find(params[:id])
    @empresa.destroy

    redirect_to empresas_path, :flash => {:notice => "Empresa excluída."}
  end
end
