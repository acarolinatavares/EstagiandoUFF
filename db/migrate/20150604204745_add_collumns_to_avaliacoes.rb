class AddCollumnsToAvaliacoes < ActiveRecord::Migration

  def self.up

    add_column :avaliacoes, :inicio_contrato, :string
    add_column :avaliacoes, :final_contrato, :string

    add_column :avaliacoes, :vale_transporte, :boolean, :default => false
    add_column :avaliacoes, :ticket_refeicao, :boolean, :default => false
    add_column :avaliacoes, :ticket_alimentacao, :boolean, :default => false
    add_column :avaliacoes, :plano_saude, :boolean, :default => false
    add_column :avaliacoes, :plano_dentario, :boolean, :default => false
    add_column :avaliacoes, :descontos, :boolean, :default => false

    add_column :avaliacoes, :titulo_cargo, :string
    add_column :avaliacoes, :area_atuacao, :string
    add_column :avaliacoes, :carga_horaria, :integer
    add_column :avaliacoes, :salario, :float

    add_column :avaliacoes, :atividades, :text
    add_column :avaliacoes, :orientador, :integer


    add_column :avaliacoes, :efetivacao, :integer
    add_column :avaliacoes, :aprendizado, :integer
    add_column :avaliacoes, :indicaria, :boolean

    add_column :avaliacoes, :comentarios, :text

  end

  def self.down
  end
end
