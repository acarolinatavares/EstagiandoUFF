class Avaliacao < ActiveRecord::Base
  attr_accessible :empresa_id, :id, :situacao_avaliacao_id, :usuario_id, :inicio_contrato, :final_contrato, :vale_transporte, :ticket_refeicao, :ticket_alimentacao, :plano_saude, :plano_dentario, :descontos, :titulo_cargo, :area_atuacao, :carga_horaria, :salario, :atividades, :orientador, :efetivacao, :aprendizado, :indicaria, :comentarios_avaliador

  has_one :situacao_avaliacao
  belongs_to :empresa
  belongs_to :usuario
  has_many :comentarios

  scope :por_nome_empresa, lambda { |empresa|
    joins(:empresa).where("empresas.nome like ?", "%#{empresa}%")
  }

  scope :por_nome_usuario, lambda { |usuario|
    joins(:usuario).where("usuarios.nome like ?", "%#{usuario}%")
  }

  scope :por_situacao, lambda { |situacao|
    where(:situacao_avaliacao_id => situacao)
  }

  scope :moderadas, where(:situacao_avaliacao_id => SituacaoAvaliacao::ACEITA)

end
