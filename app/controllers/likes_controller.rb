class LikesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @like = Like.new('gossip_id' => params[:gossip],
                      'user_id' => session[:user_id])
    @like.save
    redirect_to(request.env["HTTP_REFERER"])


  end



end
