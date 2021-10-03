class CommentsController < ApplicationController
  before_action :set_worship, only: [:create, :edit, :update]
  def index
    @worship = Worship.find_by(id: params[:worship_id])
    @comments = @worship.comments.order(created_at: :desc).page(params[:page]).per(10)
  end
  def create
    @comment = @worship.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = 'コメントを送信しました' 
        format.js { render :index}
      else
        flash.now[:alert] = 'コメントを入力して下さい' 
        format.js { render :index }
      end
    end
  end
  def edit
    @comment = @worship.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end
  def update
    @comment = @worship.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントを記入して下さい'
          format.js { render :edit_error }
        end
      end
  end  
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:worship_id, :comment, :user_id)
  end
  def set_worship
    @worship = Worship.find(params[:worship_id])
  end

end
