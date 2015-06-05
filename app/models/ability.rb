class Ability
  include CanCan::Ability

  def initialize(usuario)

    usuario ||= Usuario.new
    if usuario.administrador?
      can :manage, :all
    else
      can :read, :all

      can :create, Empresa

      can :create, Usuario

      can :modify, Usuario do |user|
        user == usuario
      end

      can :create, Avaliacao

      can [:modify,:destroy], Avaliacao do |avaliacao|
        avaliacao.usuario == usuario
      end

      can :create, Comentario

      can [:modify,:destroy], Comentario do |comentario|
        comentario.usuario == usuario
      end
    end

  end
end
