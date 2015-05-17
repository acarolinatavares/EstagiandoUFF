class SituacaoAvaliacao < ActiveRecord::Base
  attr_accessible :descricao, :id

  belongs_to :avaliacao
end
