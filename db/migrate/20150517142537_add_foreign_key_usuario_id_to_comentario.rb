class AddForeignKeyUsuarioIdToComentario < ActiveRecord::Migration
  def up
    execute "CREATE UNIQUE INDEX index_usuario_id_comentario ON #{Comentario.table_name} (usuario_id)"
    execute "ALTER TABLE #{Comentario.table_name} ADD CONSTRAINT fk_comentarios_usuarios FOREIGN KEY (usuario_id) REFERENCES #{Usuario.table_name}(id)"
  end
  def down
    execute "ALTER TABLE #{Comentario.table_name} DROP FOREIGN KEY fk_comentarios_usuarios"
    execute "DROP INDEX index_usuario_id_comentario ON #{Comentario.table_name}"
  end
end
