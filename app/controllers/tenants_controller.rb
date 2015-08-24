class TenantsController < ApplicationController
  before_action :require_shachopin_user, only:[:edit, :update]
  before_action :set_show_application_only_param, only:[:new, :index, :create, :show, :edit, :update]

  def index
    if params[:status]
      @tenants = Tenant.where(status: params[:status])
    else
      @tenants = Tenant.all
    end
  end

  def show
    @tenant = Tenant.find(params[:id])
    @tenant_comment = TenantComment.new
  end

  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      flash[:success] = "Stay put! The host will review your application very soon!"
      redirect_to tenants_path
    else
      render :new
    end
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def new
    @tenant = Tenant.new
  end

  def update
    @tenant = Tenant.find(params[:id])
    if @tenant.update(tenant_params)
      flash[:success] = "You succeefully edited the application"
      redirect_to tenants_path
    else
      render :edit
    end
  end


  private
  
  def tenant_params
    params.require(:tenant).permit!
  end

  def set_show_application_only_param
    params[:show_application_only] = true
  end


end


