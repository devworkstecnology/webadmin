class AdminWeb::VideosController < AdminWeb::ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @videos = AdminWeb::Video.all.order('id desc')
  end

  def show
    @video = AdminWeb::Video.find(params[:id])
  end

  def new
    @video = AdminWeb::Video.new
  end

  def create
    @video = AdminWeb::Video.new(permitted_params)

    if @video.save
      redirect_to videos_path, :notice => "Cadastro realizado com sucesso"
    else
      render :new
    end
  end

  def edit
    @video = AdminWeb::Video.find(params[:id])
  end

  def update
    @video = AdminWeb::Video.find(params[:id])

    if @video.update_attributes(permitted_params)
      redirect_to videos_path, :notice => "Alteração realizada com sucesso"
    else
      render :new
    end
  end

  def destroy
    @video = AdminWeb::Video.find(params[:id])
    @video.destroy

    redirect_to videos_path, :notice => "Registro excluído com sucesso"
  end

  protected

  def permitted_params
    params.require(:video).permit(:id, :description, :link)
  end
end
