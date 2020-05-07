class CommentsController < ApplicationController

  def create
    @comment = Comment.new(gossip_id: params[:gossip],
                          content: params[:content],
                          'user_id' => session[:user_id])
    if @comment.save
      flash[:success] = "yes"
      redirect_to gossip_path(@comment.gossip.id)
    else
      flash[:error] = "no"
     redirect_to gossip_path(@comment.gossip.id)
   end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    post_params = params.require(:comment).permit(:content)

    if @comment.update(post_params)
      flash[:success] = ""
      redirect_to gossip_path(@comment.gossip.id)
    else
     render :edit
   end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to gossip_path(@comment.gossip.id)

  end

end
