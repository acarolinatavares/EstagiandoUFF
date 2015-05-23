class AddColumnsToEmpresa < ActiveRecord::Migration
  def self.up
    add_column :empresas, :email, :string
    add_column :empresas, :site, :string
  end

  def self.down
    remove_column :empresas, :email
    remove_column :empresas, :site
  end
end
