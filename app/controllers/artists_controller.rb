class ArtistsController < ApplicationController
  def index
    render json: AllArtist.all.limit(50)
  end
end
