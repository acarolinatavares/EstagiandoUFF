class CreateAvaliacaos < ActiveRecord::Migration
  def change
    create_table :avaliacaos do |t|
      t.integer :id
      t.integer :usuario_id
      t.integer :empresa_id
      t.integer :situacao_avaliacao_id

      t.timestamps
    end
  end
end
