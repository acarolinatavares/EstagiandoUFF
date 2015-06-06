class ChangeCollumnComentariosOfAvaliacoes < ActiveRecord::Migration
  def up
     remove_column :avaliacoes, :comentarios
     add_column :avaliacoes, :comentarios_avaliador, :text
  end
end
