class SituacaoAvaliacao < ActiveRecord::Base
  attr_accessible :descricao, :id

  belongs_to :avaliacao

  AGUARDANDO_MODERACAO = 1
  ACEITA = 2
  REJEITADA = 3
end
