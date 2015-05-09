class AdminWeb::VideosController < AdminWeb::CrudController

  protected

  def permitted_params
    params.require(:video).permit(:id, :description, :link)
  end
end
