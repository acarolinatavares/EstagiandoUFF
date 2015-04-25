class Avaliacao < ActiveRecord::Base
  attr_accessible :empresa_id, :id, :situacao_avaliacao_id, :usuario_id
end
