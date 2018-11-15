class BandsController < ApplicationController
  # bands     GET    /bands(.:format)                       bands#index
  #           POST   /bands(.:format)                       bands#create
  # new_band  GET    /bands/new(.:format)                   bands#new
  # edit_band GET    /bands/:id/edit(.:format)              bands#edit
  # band      GET    /bands/:id(.:format)                   bands#show
  #           PATCH  /bands/:id(.:format)                   bands#update
  #           PUT    /bands/:id(.:format)                   bands#update
  #           DELETE /bands/:id(.:format)                   bands#destroy
  #
  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    band = Band.new(band_params)
    if band.save
      redirect_to band_url(band)
    else
      redirect_to bands_url
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    band = Band.find(params[:id])
    updated_band = band.update(band_params)
    if band.save
      redirect_to band_url(band)
    else
      redirect_to bands_url
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:bands).permit(:name)
  end
end
