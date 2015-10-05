# Users Controller
class UsersController < ApplicationController
  def index
    render json: User.all.limit(50)
  end

  def show
    render json: current_user
  end

  def top_5_by_sum
    render json: current_user.user_recommendations.desc(:sum_artist_weight).take(5)
  end

  def top_5_by_number
    render json: current_user.user_recommendations.desc(:total_listeners_count).take(5)
  end

  def top_5_by_tags
    render json: AllArtist.where('artist_tags.tagID' => params[:tag_id].to_i).not_in(artistID: current_user.artists.map(&:artistID).to_a).desc(:total_listeners_count).take(5)
  end

  private

  def current_user
    User.find(params[:id])
  end

  def user_params
    params[:user].permit(:userID)
  end
end
