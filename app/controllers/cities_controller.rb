class CitiesController < ApplicationController

  def show
    @array_city = City.find(params[:id])
    @id = User.where("city_id = #{params[:id]}")
    @array_gossip = Gossip.where(user: @id)
    @gossip = Gossip.all
  end
end
