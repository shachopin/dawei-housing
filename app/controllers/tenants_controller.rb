class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
    render layout:false
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      flash[:success] = "Stay put! The host will review your application very soon!"
      redirect_to tenants_path
    else
      render :new, layout:false
    end
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def new
    @tenant = Tenant.new
    params[:show_past_applicants] = true
    render layout:false
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
end