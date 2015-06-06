class Comentario < ActiveRecord::Base
  attr_accessible :data, :id, :texto, :usuario_id, :avaliacao_id

  belongs_to :avaliacao
  belongs_to :usuario
end
