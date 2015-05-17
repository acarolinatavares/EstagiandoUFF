class Avaliacao < ActiveRecord::Base
  attr_accessible :empresa_id, :id, :situacao_avaliacao_id, :usuario_id

  has_one :situacao_avaliacao
  belongs_to :empresa
  belongs_to :usuario
  has_many :comentarios

end
