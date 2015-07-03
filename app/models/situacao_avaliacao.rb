class SituacaoAvaliacao < ActiveRecord::Base
  attr_accessible :descricao, :id

  has_many :avaliacoes

  AGUARDANDO_MODERACAO = 1
  ACEITA = 2
  REJEITADA = 3
end
