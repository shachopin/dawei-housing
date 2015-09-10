class RoomCommentsController < ApplicationController
  before_action :set_room, only: [:create, :destroy]
  before_action :set_show_application_only_param, only:[:create]
  def create
    #@room_comment = @room.room_comments.build(params.require(:room_comment).permit(:body))
    # or
    @room_comment = RoomComment.new(params.require(:room_comment).permit(:body))
    @room_comment.room = @room

    if @room_comment.save
      flash[:success] = "Thank you for commenting"
      redirect_to room_path(@room)
    else
      render 'rooms/show'
    end
  end

  def destroy
    room_comment = RoomComment.find params[:id]
    room_comment.destroy
    flash[:success] = "You have successfully deleted a comment from the database"
    redirect_to room_path(@room)
  end

  private
  def set_show_application_only_param
    params[:show_application_only] = true
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

end