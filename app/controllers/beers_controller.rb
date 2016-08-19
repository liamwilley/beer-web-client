class BeersController < ApplicationController
  
  def index
    @beers = Unirest.get("#{ENV['DOMAIN']}/beers.json").body
  end

  def show
    @beer = Unirest.get("#{ENV['DOMAIN']}/beers/.json").body
  end

  def new

  end

  def create
    @beer = Unirest.post("#{ENV['DOMAIN']}/beers/.json", parameters: {name: params[:name], price: params[:price], alcohol_percentage: params[:alcohol_percentage], beer_type: params[beer_type]}).body
    redirect_to "/beers/#{@beer['id']}"
  end

  def edit
    @beer = Unirest.get("#{ENV['DOMAIN']}/beers/#{params[:id]}.json").body
  end

  def update
   @beer = Unirest.patch("#{ENV['DOMAIN']}/beers/#{params[:id]}.json", parameters: {name: params[:name], price: params[:price], alcohol_percentage: params[:alcohol_percentage], beer_type: params[:beer_type]}).body
   redirect_to "/beers/#{@beer['id']}"
  end

  def destroy
    Unirest.delete("#{ENV['DOMAIN']}/beers/#{params[:id]}.json").body
    redirect_to "/beers"
  end

end
