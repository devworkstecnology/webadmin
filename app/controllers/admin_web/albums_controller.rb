class AdminWeb::AlbumsController < AdminWeb::CrudController

  protected

  def permitted_params
    params.require(:album).permit(:id, :title, :date, :local)
  end
end
