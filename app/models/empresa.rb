class Empresa < ActiveRecord::Base
  attr_accessible :id, :nome

  has_many :avaliacoes
end
