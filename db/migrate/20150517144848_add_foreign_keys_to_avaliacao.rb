class AddForeignKeysToAvaliacao < ActiveRecord::Migration
  def up
    #Usuario
    execute "CREATE UNIQUE INDEX index_usuario_id_avaliacao ON #{Avaliacao.table_name} (usuario_id)"
    execute "ALTER TABLE #{Avaliacao.table_name} ADD CONSTRAINT fk_avaliacoes_usuarios FOREIGN KEY (usuario_id) REFERENCES #{Usuario.table_name}(id)"

    #Empresa
    execute "CREATE UNIQUE INDEX index_empresa_id_avaliacao ON #{Avaliacao.table_name} (empresa_id)"
    execute "ALTER TABLE #{Avaliacao.table_name} ADD CONSTRAINT fk_avaliacoes_empresas FOREIGN KEY (empresa_id) REFERENCES #{Empresa.table_name}(id)"

    #Situacao_Avaliação
    execute "CREATE UNIQUE INDEX index_situacao_avaliacao_id_avaliacao ON #{Avaliacao.table_name} (situacao_avaliacao_id)"
    execute "ALTER TABLE #{Avaliacao.table_name} ADD CONSTRAINT fk_avaliacoes_situacoes FOREIGN KEY (situacao_avaliacao_id) REFERENCES #{SituacaoAvaliacao.table_name}(id)"
  end
  def down
    #Usuario
    execute "ALTER TABLE #{Avaliacao.table_name} DROP FOREIGN KEY fk_avaliacoes_usuarios"
    execute "DROP INDEX index_usuario_id_avaliacao ON #{Avaliacao.table_name}"

    #Empresa
    execute "ALTER TABLE #{Avaliacao.table_name} DROP FOREIGN KEY fk_avaliacoes_empresas"
    execute "DROP INDEX index_empresa_id_avaliacao ON #{Avaliacao.table_name}"

    #Situacao_Avaliação
    execute "ALTER TABLE #{Avaliacao.table_name} DROP FOREIGN KEY fk_avaliacoes_situacoes"
    execute "DROP INDEX index_situacao_avaliacao_id_avaliacao ON #{Avaliacao.table_name}"
  end
end
