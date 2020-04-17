class SongsController < ApplicationController
  def index
    @q = Song.ransack(params[:q])
    @songs = @q.result.page(params[:page])
  end
end
