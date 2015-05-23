class EmpresasController < ApplicationController
  def index
    @empresas = Empresa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @empresas }
    end
  end

  def show
    @empresa = Empresa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @empresa }
    end
  end

  def new
    @empresa = Empresa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @empresa }
    end
  end

  def edit
    @empresa = Empresa.find(params[:id])
  end

  def create
    binding.pry
    @empresa = Empresa.new(params[:empresa])

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, notice: 'Empresa cadastrada com sucesso.' }
        format.json { render json: @empresa, status: :created, location: @empresa }
      else
        format.html { render action: "new" }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @empresa = Empresa.find(params[:id])

    respond_to do |format|
      if @empresa.update_attributes(params[:empresa])
        format.html { redirect_to @empresa, notice: 'Empresa atualizada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @empresa = Empresa.find(params[:id])
    @empresa.destroy

    respond_to do |format|
      format.html { redirect_to empresas_url }
      format.json { head :no_content }
    end
  end
end
