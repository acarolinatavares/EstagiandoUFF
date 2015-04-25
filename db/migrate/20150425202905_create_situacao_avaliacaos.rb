class CreateSituacaoAvaliacaos < ActiveRecord::Migration
  def change
    create_table :situacao_avaliacaos do |t|
      t.integer :id
      t.string :descricao

      t.timestamps
    end
  end
end
