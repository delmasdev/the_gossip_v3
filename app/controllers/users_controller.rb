class UsersController < ApplicationController

  def show
    @id = User.where("first_name LIKE ?", "%#{params[:id]}").ids
    @id = @id.join
    @array_user = User.find(@id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new( 'email' => params[:email],
                      'password' => params[:password],
                      'first_name' => params[:first_name],
                      'last_name' => params[:last_name],
                      'age' => params[:age],
                      'city_id' => rand(1..10),
                      'description' => params[:description])
    if @user.save
      log_in(@user)
      @array_user = User.all
      flash.now[:success] = ""
      redirect_to gossips_path
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end


end
