class WebAdmin::InstitutionalsController < WebAdmin::CrudController
  
  protected

  def permitted_params
    params.require(:institutional).permit(:id, :name, :body)
  end
end
