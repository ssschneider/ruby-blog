class PostsController < ApplicationController
  before_action :set_post, only: [ :edit, :update, :destroy ]
  def index
    @posts = Post.all
  end

  def my_posts
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    if @post.save!
      redirect_to my_posts_path, notice: "Post criado com sucesso"
    else
      redirect_to new_post_path, alert: "Erro ao criar o post, tente novamente"
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      redirect_to my_posts_path, notice: "Post editado com sucesso"
    else
      redirect_to edit_post_path, alert: "Erro ao editar o post, tente novamente"
    end
  end

  def destroy
    if @post.destroy
      redirect_to my_posts_path, notice: "Post excluído com sucesso"
    else
      redirect_to my_posts_path, alert: "Erro ao excluir o post, tente novamente"
    end
  end

  private
  def posts_params
    params.require(:post).permit(:title, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
