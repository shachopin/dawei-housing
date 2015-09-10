class TenantCommentsController < ApplicationController
  before_action :set_show_application_only_param, only:[:create]
  def create
    @tenant = Tenant.find(params[:tenant_id])
    #@comment = @bug.comments.build(params.require(:comment).permit(:body))
    # or
    @tenant_comment = TenantComment.new(params.require(:tenant_comment).permit(:body))
    @tenant_comment.tenant = @tenant

    if @tenant_comment.save
      flash[:success] = "Thank you for commenting"
      redirect_to tenant_path(@tenant)
    else
      render 'tenants/show'
    end
  end

  private
  def set_show_application_only_param
    params[:show_application_only] = true
  end

end