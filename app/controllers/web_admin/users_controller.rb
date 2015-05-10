class WebAdmin::UsersController < WebAdmin::CrudController
  def new
    super

    current_user.permissions.where(["permission_type <> ?", WebAdmin::PermissionType::DENY]).each do |permission|
      @object.permissions.build(model: permission.model, permission_type: permission.permission_type)
    end
  end

  protected

  def permitted_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation, permissions_attributes: [:id, :permission_type, :model])
  end
end
