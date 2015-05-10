class WebAdmin::VideosController < WebAdmin::CrudController

  protected

  def permitted_params
    params.require(:video).permit(:id, :description, :link)
  end
end
