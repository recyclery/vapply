class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.is_admin?

      can [:read, :create], Board
      can :update, Board do |board|
        user.has_ownership?(board)
      end
      can :manage, Caseworker
      can :manage, Client

    else

      can :create, Client
      can [:read, :update], [Client, Caseworker] do |model|
        if model.nil? then true
        else user.has_ownership?(model)
        end
      end

    end
  end
end
