class AlbumsController < ApplicationController
  before_action :require_login

  def new
    @bands = Band.all
    render :new
  end

  def create
    album = Album.new(album_params)
    if album.save
      redirect_to album_url(album)
    else
      redirect_to band_albums_url
    end
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit
  end

  def update
    album = Album.find(params[:id])
    updated_album = album.update(album_params)
    if album.save
      redirect_to album_url(album)
    else
      redirect_to albums_url
    end
  end

  def show
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    render :show
  end

  def destroy
    album = Album.find(params[:id])
    band = Band.find(album.band_id)
    album.destroy
    redirect_to band_url(band)
  end

  private
  def album_params
    params.require(:albums).permit(:name, :band_id)
  end

  def require_login
    unless current_user
      redirect_to new_session_url
    end
  end
end
