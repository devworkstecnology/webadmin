class AdminWeb::UsersController < AdminWeb::ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = AdminWeb::User.all.order('id desc')
  end

  def show
    @user = AdminWeb::User.find(params[:id])
  end

  def new
    @user = AdminWeb::User.new
  end

  def create
    @user = AdminWeb::User.new(permitted_params)
    @user.convencional!

    if @user.save
      redirect_to users_path, :notice => "Cadastro realizado com sucesso"
    else
      render :new
    end
  end

  def edit
    @user = AdminWeb::User.find(params[:id])
  end

  def update
    @user = AdminWeb::User.find(params[:id])

    if @user.update_attributes(permitted_params)
      redirect_to users_path, :notice => "Alteração realizada com sucesso"
    else
      render :new
    end
  end

  def destroy
    @user = AdminWeb::User.find(params[:id])
    @user.destroy

    redirect_to users_path, :notice => "Registro excluído com sucesso"
  end

  protected

  def permitted_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation)
  end
end
