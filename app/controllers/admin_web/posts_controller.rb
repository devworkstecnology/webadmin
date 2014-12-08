class AdminWeb::PostsController < AdminWeb::ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @posts = AdminWeb::Post.all.order('id desc')
  end

  def show
    @post = AdminWeb::Post.find(params[:id])
  end

  def new
    @post = AdminWeb::Post.new
  end

  def create
    @post = AdminWeb::Post.new(permitted_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path, :notice => "Cadastro realizado com sucesso"
    else
      render :new
    end
  end

  def edit
    @post = AdminWeb::Post.find(params[:id])
  end

  def update
    @post = AdminWeb::Post.find(params[:id])

    if @post.update_attributes(permitted_params)
      redirect_to posts_path, :notice => "Alteração realizada com sucesso"
    else
      render :new
    end
  end

  def destroy
    @post = AdminWeb::Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, :notice => "Registro excluído com sucesso"
  end

  protected

  def permitted_params
    params.require(:post).permit(:id, :title, :abstract, :image, :body)
  end
end
