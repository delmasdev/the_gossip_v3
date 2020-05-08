class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
  end

  def create

    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to gossips_path

    else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end
  end

  def destroy
    session.delete(:user_id)
    redirect_to(request.env["HTTP_REFERER"])
  end

end
