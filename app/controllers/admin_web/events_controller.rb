class AdminWeb::EventsController < AdminWeb::ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @events = AdminWeb::Event.all.order('id desc')
  end

  def show
    @event = AdminWeb::Event.find(params[:id])
  end

  def new
    @event = AdminWeb::Event.new
  end

  def create
    @event = AdminWeb::Event.new.localized(permitted_params)

    if @event.save
      redirect_to events_path, :notice => "Cadastro realizado com sucesso"
    else
      render :new
    end
  end

  def edit
    @event = AdminWeb::Event.find(params[:id]).localized
  end

  def update
    @event = AdminWeb::Event.find(params[:id])

    if @event.update_attributes(permitted_params)
      redirect_to events_path, :notice => "Alteração realizada com sucesso"
    else
      render :new
    end
  end

  def destroy
    @event = AdminWeb::Event.find(params[:id])
    @event.destroy

    redirect_to events_path, :notice => "Registro excluído com sucesso"
  end

  protected

  def permitted_params
    params.require(:event).permit(:id, :title, :start_date, :end_date,
      :description, :street, :zipcode, :number, :neighborhood, :city, :state)
  end
end
