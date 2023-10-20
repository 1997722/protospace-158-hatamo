class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    @prototype = @comment.prototype
    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      @comments = @prototype.comments
    render 'prototypes/show',status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:prototype,:user).merge(user_id:current_user.id,prototype_id: params[:prototype_id])
  end
end
