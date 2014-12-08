class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminWeb::User.new

    if user.admin?
      can :manage, :all
    else
      can :manage, AdminWeb::Album
      can :manage, AdminWeb::Institutional
      can :manage, AdminWeb::Post
      can :manage, AdminWeb::Image
      can :manage, AdminWeb::Video
      can [:edit, :update], AdminWeb::User, id: user.id
    end
  end
end
