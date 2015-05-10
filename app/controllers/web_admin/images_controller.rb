class WebAdmin::ImagesController < WebAdmin::CrudController

  protected

  def permitted_params
    params.require(:image).permit(:id, :album_id, :cover, :file)
  end
end
