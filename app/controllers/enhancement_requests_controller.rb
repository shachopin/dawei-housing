class EnhancementRequestsController < ApplicationController
  def index
    @enhancement_requests = EnhancementRequest.all
  end
end