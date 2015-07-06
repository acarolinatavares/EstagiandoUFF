class AddEnderecoToEmpresa < ActiveRecord::Migration
  def self.up
    add_column :empresas, :endereco, :string
    add_column :empresas, :telefone, :string
  end

  def self.down
    remove_column :empresas, :endereco
    remove_column :empresas, :telefone
  end
end
