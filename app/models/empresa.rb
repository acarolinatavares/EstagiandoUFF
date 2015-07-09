class Empresa < ActiveRecord::Base
  attr_accessible :id, :nome, :email, :site, :endereco, :telefone

  #attr_accessible :avatar
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  has_many :avaliacoes

  scope :empresas_tokeninput, lambda{ |busca|
    Empresa.where("empresas.nome LIKE ?", "%#{busca}%")
  }
end
