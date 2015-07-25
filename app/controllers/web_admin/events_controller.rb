class WebAdmin::EventsController < WebAdmin::CrudController

  protected

  def permitted_params
    params.require(:event).permit(:id, :title, :start_date, :end_date, :image,
      :description, :street, :zipcode, :number, :neighborhood, :city, :state)
  end
end
