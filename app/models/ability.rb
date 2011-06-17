class Ability
  include CanCan::Ability

  def initialize(user)
    can [:new,:purchase,:create], Order
    can :create, User
    can [:new,:create], Message
    can :show, InfoSection, :deleted => 0 
    can :default, InfoSection

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
          can [:show,:create,:update,:destroy], InfoSection
          can [:index,:destroy,:ascend,:descend], InfoSubsection
          can [:create,:update], Locale
          can [:index,:create,:delete], Translation
          can [:show,:update], Setting
        end
      end
    end
  end
end
