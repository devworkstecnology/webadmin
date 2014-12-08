class AdminWeb::ImagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @image = AdminWeb::Image.create(permitted_params)
  end

  def update
    @image = AdminWeb::Image.find(params[:id])

    image_cover = AdminWeb::Album.find(@image.album_id).images.where('cover is true').first
    if image_cover.present?
      image_cover.cover = false
      image_cover.save
    end

    @image.cover = true
    @image.save

    flash[:notice] = "Alterado com sucesso."

  end

  def destroy
    @image = AdminWeb::Image.find(params[:id])
    @image.destroy
  end

  protected

  def permitted_params
    params.require(:image).permit(:id, :album_id, :cover, :file)
  end
end
