class GossipsController < ApplicationController

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
    @gossip = Gossip.new( user_id: rand(1..10),
                        'title' => params[:title],
                        'content' => params[:content])
    if @gossip.save
      @array_gossip = Gossip.all
      flash.now[:success] = ""
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
      flash.now[:success] = ""
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




end
