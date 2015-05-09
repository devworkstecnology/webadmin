class AdminWeb::PostsController < AdminWeb::CrudController
  def create
    @object = AdminWeb::Post.new(permitted_params)
    @object.user = current_user

    if @object.save
      flash[:notice] = I18n.t("flash.actions.create.notice", resource_name: I18n.t("activerecord.models.#{controller_name.singularize}"))
      respond_with [controller_name]
    else
      render 'new'
    end
  end

  protected

  def permitted_params
    params.require(:post).permit(:id, :title, :abstract, :image, :body)
  end
end
