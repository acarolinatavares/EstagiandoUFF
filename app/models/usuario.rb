class Usuario < ActiveRecord::Base
  attr_accessible :administrador, :email, :id, :nome, :senha, :verificado
end
