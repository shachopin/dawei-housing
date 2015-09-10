class CommentsController < ApplicationController
  before_action :require_user

  def create
    @bug = Bug.find(params[:bug_id])
    #@comment = @bug.comments.build(params.require(:comment).permit(:body))
    # or
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.bug = @bug

    @comment.creator = current_user

    if @comment.save
      flash[:success] = "Thank you for commenting"
      redirect_to bug_path(@bug)
    else
      render 'bugs/show'
    end
  end

  def destroy
    @bug = Bug.find(params[:bug_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "You have successfully deleted a comment from the database"
    redirect_to bug_path(@bug)
  end
end