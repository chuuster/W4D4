class BandsController < ApplicationController
  before_action :require_login
  
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

  def require_login
    unless current_user
      redirect_to new_session_url
    end
  end
end
