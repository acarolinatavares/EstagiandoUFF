class Usuario < ActiveRecord::Base
  attr_accessible :administrador, :email, :id, :nome, :senha, :email_confirmed, :confirm_token
  validates :senha, length: { minimum: 6 }

  has_many :comentarios
  has_many :avaliacoes

  before_create :confirmation_token

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
