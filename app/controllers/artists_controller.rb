# Artists Controller
class ArtistsController < ApplicationController
  def index
    render json: AllArtist.all.limit(50)
  end

  def show
    render json: AllArtist.find(params[:id])
  end

  def show_artist_id
    render json: AllArtist.find_by(artistID: params[:id])
  end

  def top_5_by_sum
    render json: AllArtist.all.desc(:sum_artist_weight).take(5)
  end

  def top_5_by_number
    render json: AllArtist.all.desc(:total_listeners_count).take(5)
  end

  def top_5_by_tags
    render json: AllArtist.where('artist_tags.tagID' => params[:tag_id].to_i).desc(:sum_artist_weight).take(5)
  end

  private

  def artist_params
    params[:artist].permit(:artistID, :name, :url, :picture_url)
  end
end
