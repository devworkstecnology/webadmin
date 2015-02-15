class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminWeb::User.new

    alias_action :create, :read, :update, :destroy, :to => :access
    alias_action :read, :update, to: :modify

    user.permissions.each do |permission|
      can permission.permission_type.to_sym, eval(permission.model.split('/').map {|k| k.split('_').map {|k| k.capitalize} }.map { |k| k.join }.join('::').singularize)
    end
  end
end
