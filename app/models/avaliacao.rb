class Avaliacao < ActiveRecord::Base
  attr_accessible :empresa_id, :id, :situacao_avaliacao_id, :usuario_id, :inicio_contrato, :final_contrato, :vale_transporte, :ticket_refeicao, :ticket_alimentacao, :plano_saude, :plano_dentario, :descontos, :titulo_cargo, :area_atuacao, :carga_horaria, :salario, :atividades, :orientador, :efetivacao, :aprendizado, :indicaria, :comentarios_avaliador

  has_one :situacao_avaliacao
  belongs_to :empresa
  belongs_to :usuario
  has_many :comentarios

end
