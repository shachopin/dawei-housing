class BugsController < ApplicationController
  before_action :require_user
  before_action :set_bug, only: [:edit, :update, :show, :destroy]
  before_action :require_creator_or_shachopin, only: [:edit, :update]


  def index
    @bugs = Bug.all
  end

  def edit; end

  def update
    if @bug.update(bug_params)
      flash[:success] = "A new bug is successfully edited"
      redirect_to bugs_path    
    else
      render :edit
    end
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.creator = current_user
    if @bug.save
      flash[:success] = "A new bug is successfully created"
      redirect_to bugs_path    
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @bug.destroy
    flash[:success] = "You have successfully deleted an issue from the database"
    redirect_to bugs_path
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :body, category_ids: [])
  end

  def set_bug
    @bug = Bug.find(params[:id]) 
  end

  def require_creator_or_shachopin
    unless logged_in_as_shachopin? || current_user == @bug.creator
      flash[:warning] = "You have no right to do that"
      redirect_to bugs_path
    end
  end
end