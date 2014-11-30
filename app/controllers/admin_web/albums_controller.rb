class AdminWeb::AlbumsController < AdminWeb::ApplicationController
  before_action :authenticate_user!

  def index
    @albums = AdminWeb::Album.all.order('id desc')
  end

  def show
    @album = AdminWeb::Album.find(params[:id])
  end

  def new
    @album = AdminWeb::Album.new
  end

  def create
    @album = AdminWeb::Album.new.localized(permitted_params)

    if @album.save
      redirect_to albums_path, :notice => "Cadastro realizado com sucesso"
    else
      render :new
    end
  end

  def edit
    @album = AdminWeb::Album.find(params[:id]).localized
  end

  def update
    @album = AdminWeb::Album.find(params[:id])

    if @album.update_attributes(permitted_params)
      redirect_to albums_path, :notice => "Alteração realizada com sucesso"
    else
      render :new
    end
  end

  def destroy
    @album = AdminWeb::Album.find(params[:id])
    @album.destroy

    redirect_to albums_path, :notice => "Registro excluído com sucesso"
  end

  protected

  def permitted_params
    params.require(:album).permit(:id, :title, :date, :local)
  end
end
