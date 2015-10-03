# Tags Controller
class TagsController < ApplicationController
  def index
    render json: AllTag.all
  end
end
