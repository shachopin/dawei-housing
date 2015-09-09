class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :like]
  before_action :set_show_application_only_param, only: [:index, :show, :new, :create, :update, :edit]

  def index
    if params[:status]
      @rooms = Room.where(status: params[:status]).sort_by{|room|room.like_true_size}.reverse
    else
      @rooms = Room.all.sort_by{|room|room.like_true_size}.reverse
    end
  end

  def show;end

  def new
    @room = Room.new
  end

  def edit;end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Room is created"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      flash[:success] = "Room is updated"
      redirect_to rooms_path
    else
      render :edit
    end
  end

  def like
    like = Like.create(likeable: @room, like: params[:like]) 
    respond_to do |format| 
      format.html do
        if like.valid?
          flash[:success] = "Your like was counted"
        else
          flash[:warning]  = "Youe like was not counted"
        end 
        redirect_to :back
      end
      format.js
    end
  end

  private 
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit!
  end

  def set_show_application_only_param
    params[:show_application_only] = true
  end
end