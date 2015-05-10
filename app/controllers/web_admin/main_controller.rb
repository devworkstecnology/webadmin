class WebAdmin::MainController < WebAdmin::ApplicationController
  before_action :authenticate_user!

  def index

  end
end
