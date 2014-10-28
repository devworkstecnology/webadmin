class AdminWeb::InstitucionalsController < AdminWeb::ApplicationController
    before_action :authenticate_user!

  def index
    @institucionals = AdminWeb::Institucional.all.order('id desc')
  end

  def show
    @institucional = AdminWeb::Institucional.find(params[:id])
  end

  def new
    @institucional = AdminWeb::Institucional.new
  end

  def create
    @institucional = AdminWeb::Institucional.new(permitted_params)

    if @institucional.save
      redirect_to institucionals_path, :notice => "Cadastro realizado com sucesso"
    else
      render :new
    end
  end

  def edit
    @institucional = AdminWeb::Institucional.find(params[:id])
  end

  def update
    @institucional = AdminWeb::Institucional.find(params[:id])

    if @institucional.update_attributes(permitted_params)
      redirect_to institucionals_path, :notice => "Alteração realizada com sucesso"
    else
      render :new
    end
  end

  def destroy
    @institucional = AdminWeb::Institucional.find(params[:id])
    @institucional.destroy

    redirect_to institucionals_path, :notice => "Registro excluído com sucesso"
  end

  protected

  def permitted_params
    params.require(:institucional).permit(:id, :name, :body)
  end
end
