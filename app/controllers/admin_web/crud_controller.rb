class AdminWeb::CrudController < AdminWeb::ApplicationController
  helper_method :object_class
  before_filter :authenticate_user!

  load_and_authorize_resource

  respond_to :json, :html

  def index
    @objects = object_class.all.order('id desc')
  end

  def new
    @object = object_class.new
  end

  def create
    @object = object_class.new(permitted_params)
  
    if @object.save
      flash[:notice] = I18n.t("flash.actions.create.notice", resource_name: I18n.t("activerecord.models.#{controller_name.singularize}"))
      respond_with [controller_name]
    else
      render 'new'
    end
  end

  def edit
    @object = object_class.find(params[:id]).localized
  end

  def update
    @object = object_class.find params[:id]
    if @object.update_attributes(permitted_params)
      flash[:notice] = I18n.t("flash.actions.update.notice", resource_name: I18n.t("activerecord.models.#{controller_name.singularize}"))
      respond_with [controller_name]
    else
      render 'edit'
    end
  end

  def destroy
    @object = object_class.find params[:id]
    @object.destroy
    flash[:notice] = I18n.t("flash.actions.destroy.notice", resource_name: I18n.t("activerecord.models.#{controller_name.singularize}"))
    respond_with [controller_name]
  end

  protected

  def object_class
    "AdminWeb::#{controller_name.singularize.camelize}".constantize
  end

  def params_key
    controller_name.singularize
  end

  def permitted_params
  end
end
