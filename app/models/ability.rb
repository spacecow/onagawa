class Ability
  include CanCan::Ability

  def initialize(user)
    can [:new,:create], Order
    can :create, User

    if user
      if user.role? :god
        can :manage, :all
      else
        if user.role?(:member) || user.role?(:mini_admin) || user.role?(:admin)
          can :update, User, :id => user.id
          can :show, User
        end
        if user.role?(:mini_admin) || user.role?(:admin)
          can [:index,:update], User
        end
        if user.role? :admin
          can [:edit_roles, :update_roles, :destroy], User
        end
      end
    end
  end
end
