class CommentsController < ApplicationController
  before_action :set_worship, only: [:create, :edit, :update]

  def index
    @worship = Worship.find_by(id: params[:worship_id])
    @comments = @worship.comments.order(created_at: :desc).page(params[:page]).per(10)
  end

  respond_to? :js
  def create
    @comment = @worship.comments.build(comment_params)
    if @comment.save
      flash.now[:notice] = 'コメントを送信しました'
      render :index
    else
      flash.now[:alert] = ' コメントを入力して下さい' 
      render :failure
    end
  end

  def edit
    @comment = @worship.comments.find(params[:id])
    flash.now[:notice] = 'コメントの編集中'
    render :edit 
  end

  def update
    @comment = @worship.comments.find(params[:id])
    if @comment.update(comment_params)
      flash.now[:notice] = 'コメントが編集されました'
    else
      flash.now[:notice] = 'コメントを記入して下さい'
    end
    render :index 
  end  
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index 
  end


  private
  def comment_params
    params.require(:comment).permit(:worship_id, :comment, :user_id)
  end
  def set_worship
    @worship = Worship.find(params[:worship_id])
  end

end
