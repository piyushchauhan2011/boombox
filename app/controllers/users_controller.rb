# Users Controller
class UsersController < ApplicationController
  def index
    render json: User.all.limit(50)
  end

  def show
    render json: current_user
  end

  def listen
    u = current_user
    a = u.artists.where(artistID: params[:artist_id]).to_a
    if (a != [])
      a[0].weight = a[0].weight + 1
      a[0].save
    else
      tmp_a = AllArtist.find_by(artistID: params[:artist_id])
      a[0] = u.artists.create(artistID: tmp_a.artistID, weight: 1)
    end
    render json: a[0]
  end

  def assign_tag
    u = current_user
    a = AllArtist.find_by(artistID: params[:artist_id])
    t = AllTag.find_by(tagID: params[:tag_id])
    tag = a.artist_tags.find_or_create_by(tagID: t.tagID)
    tag.tag_value = t.tag_value
    tag.timestamp = DateTime.now
    tag.save
    a.save
    render json: a
  end

  def add_friend
    u = current_user
    u2 = User.find_by(userID: params[:user_id])
    u.friends.push(u2)
    render json: u
  end

  def artist
    render json: current_user.artists.find_by(artistID: params[:artist_id])
  end

  def show_user_id
    render json: User.find_by(userID: params[:id])
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
