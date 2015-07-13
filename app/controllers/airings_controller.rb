class AiringsController < ApplicationController

  before_action :authorize

  def new
    @airing = Airing.new
    #not sure I'll use this either, but look up client from params?
    @client = Client.find(params[:client_id])
  end

  def create
    @airing = Airing.new(airing_params)

    if @airing.save
      #after we successfully add a show, take me to adding airings of the show
      redirect_to client_path(airing_params[:client_id])
    else
      flash[:message] = "Info Missing, Please try again."
      # if the post fails, I need to look up the network again
      # because new.html.erb includes the @client instance variable.
      @client = Client.find(airing_params[:client_id])
      render client_path(@client)
    end
  end

  def edit
    @airing = Airing.find(params[:id])
    @client = @airing.client.id
  end

  def update
    @airing = Airing.find(params[:id])
    @client = @airing.client.id
    if @airing.update(airing_params)
      redirect_to client_path(@client)
    else 
      render :edit
    end
  end

  def destroy
    @airing = Airing.find(params[:id])
    @airing.destroy
    redirect_to '/'
  end
private

  def airing_params
    params.require(:airing).permit(:show_id, :client_id, :net_cost, :gross_cost, :airdate, :airweek_id)
  end

end