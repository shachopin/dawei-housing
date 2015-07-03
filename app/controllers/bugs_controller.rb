class BugsController < ApplicationController
  before_action :require_user
  before_action :set_bug, only: [:edit, :update, :show]


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

  private

  def bug_params
    params.require(:bug).permit(:title, :body, category_ids: [])
  end

  def set_bug
    @bug = Bug.find(params[:id]) 
  end
end