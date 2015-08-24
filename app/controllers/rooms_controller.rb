class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :set_show_application_only_param, only: [:index, :show, :new, :create, :update, :edit]

  def index
    if params[:status]
      @rooms = Room.where(status: params[:status])
    else
      @rooms = Room.all
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