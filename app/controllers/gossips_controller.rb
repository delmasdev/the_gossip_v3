class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:create, :new]


  def index
    @array_gossip = Gossip.all
  end

  def show
    @array_gossip = Gossip.find(params[:id])
    @comment = Comment.new

  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new( 'user_id' => session[:user_id],
                        'title' => params[:title],
                        'content' => params[:content])
    if @gossip.save
      @array_gossip = Gossip.all
      flash[:success] = ""
      render 'gossips/index.html.erb'
    else
      render 'gossips/new.html.erb'
    end
  end

  def edit
    @array_gossip = Gossip.find(params[:id])
  end

  def update
    @array_gossip = Gossip.find(params[:id])

    post_params = params.require(:gossip).permit(:title, :content)

    if @array_gossip.update(post_params)
      flash[:success] = ""
      render :show
    else
     render :edit
   end
  end

  def destroy
    @array_gossip = Gossip.find(params[:id])
    @array_gossip.destroy

    redirect_to gossips_path

  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
