class Usuario < ActiveRecord::Base
  attr_accessible :administrador, :email, :id, :nome, :senha, :verificado

  has_many :comentarios
  has_many :avaliacoes
end
