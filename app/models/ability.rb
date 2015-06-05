class Ability
  include CanCan::Ability

  def initialize(usuario)

    can :create, Usuario

    can :read, :all

    if !usuario.nil? && usuario.administrador?
      can :manage, :all
    else
      can :read, :all

      can :create, Empresa

      can :create, Avaliacao

      can :autocomplete_empresas, Avaliacao


      can :modify, Usuario do |user|
        user == usuario
      end

      can [:modify,:destroy], Avaliacao do |avaliacao|
        avaliacao.usuario == usuario
      end

      can [:modify,:destroy], Comentario do |comentario|
        comentario.usuario == usuario
      end
    end

  end
end
