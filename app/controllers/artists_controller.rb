class ArtistsController < ApplicationController
  before_action :navbar_ransack

  def index
    @artists = Artist.page(params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private
  def navbar_ransack
    @q = Song.ransack(params[:q])
  end
end
