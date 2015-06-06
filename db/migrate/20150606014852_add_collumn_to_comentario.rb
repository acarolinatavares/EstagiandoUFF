class AddCollumnToComentario < ActiveRecord::Migration
  def up
    add_column :comentarios, :avaliacao_id, :integer
  end
end
