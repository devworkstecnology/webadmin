class WebAdmin::AlbumsController < WebAdmin::CrudController

  protected

  def permitted_params
    params.require(:album).permit(:id, :title, :date, :local)
  end
end
