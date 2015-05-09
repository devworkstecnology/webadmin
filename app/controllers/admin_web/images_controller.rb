class AdminWeb::ImagesController < AdminWeb::CrudController

  protected

  def permitted_params
    params.require(:image).permit(:id, :album_id, :cover, :file)
  end
end
