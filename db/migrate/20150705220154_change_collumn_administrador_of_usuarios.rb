class ChangeCollumnAdministradorOfUsuarios < ActiveRecord::Migration
  def up
     remove_column :usuarios, :administrador
     add_column :usuarios, :administrador, :boolean, :default => false
  end
end
