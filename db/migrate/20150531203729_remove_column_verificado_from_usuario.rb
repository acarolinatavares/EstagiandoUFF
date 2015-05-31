class RemoveColumnVerificadoFromUsuario < ActiveRecord::Migration
  def change
    remove_column :usuarios, :verificado
  end
end
