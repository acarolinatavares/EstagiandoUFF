class CreateSituacaoavaliacoes < ActiveRecord::Migration
  def change
    create_table :situacao_avaliacoes do |t|
      t.integer :id
      t.string :descricao

      t.timestamps
    end
  end
end
