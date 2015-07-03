class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :create, Usuario

      can :read, :all
      can :pesquisar, Avaliacao
    else
      if user.administrador?
        can :manage, :all
      else
        can :read, :all

        can :create, Empresa

        can :create, Comentario

        can :create, Avaliacao

        can :autocomplete_empresas, Avaliacao

        can :modify, Usuario do |user1|
          user1 == user
        end

        can [:modify,:destroy], Avaliacao do |avaliacao|
          avaliacao.usuario == user
        end

        can [:modify,:destroy], Comentario do |comentario|
          comentario.usuario == user
        end
      end
    end

  end
end
