class AdminWeb::InstitutionalsController < AdminWeb::ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @institutionals = AdminWeb::Institutional.all.order('id desc')
  end

  def show
    @institutional = AdminWeb::Institutional.find(params[:id])
  end

  def new
    @institutional = AdminWeb::Institutional.new
  end

  def create
    @institutional = AdminWeb::Institutional.new(permitted_params)

    if @institutional.save
      redirect_to institutionals_path, :notice => "Cadastro realizado com sucesso"
    else
      render :new
    end
  end

  def edit
    @institutional = AdminWeb::Institutional.find(params[:id])
  end

  def update
    @institutional = AdminWeb::Institutional.find(params[:id])

    if @institutional.update_attributes(permitted_params)
      redirect_to institutionals_path, :notice => "Alteração realizada com sucesso"
    else
      render :new
    end
  end

  def destroy
    @institutional = AdminWeb::Institutional.find(params[:id])
    @institutional.destroy

    redirect_to institutionals_path, :notice => "Registro excluído com sucesso"
  end

  protected

  def permitted_params
    params.require(:institutional).permit(:id, :name, :body)
  end
end
