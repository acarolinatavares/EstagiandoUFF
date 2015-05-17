class AddForeignKeyAvaliacaoIdToComentario < ActiveRecord::Migration
  def up
    execute  "ALTER TABLE #{Comentario.table_name} ADD avaliacao_id int(11);"
    execute "CREATE UNIQUE INDEX index_avaliacao_id_comentario ON #{Comentario.table_name} (avaliacao_id)"
    execute "ALTER TABLE #{Comentario.table_name} ADD CONSTRAINT fk_comentarios_avaliacoes FOREIGN KEY (avaliacao_id) REFERENCES #{Avaliacao.table_name}(id)"
  end
  def down
    execute "ALTER TABLE #{Comentario.table_name} DROP FOREIGN KEY fk_comentarios_avaliacoes"
    execute "DROP INDEX index_avaliacao_id_comentario ON #{Comentario.table_name}"
    execute "ALTER TABLE #{Comentario.table_name} DROP avaliacao_id"
  end
end
