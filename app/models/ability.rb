class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= Usuario.new
    if user.administrador
      can :manage, :all
    else
      can :read, :all
    end

  end
end
