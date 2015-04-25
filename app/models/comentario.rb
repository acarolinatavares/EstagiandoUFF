class Comentario < ActiveRecord::Base
  attr_accessible :data, :id, :texto, :usuario_id
end
