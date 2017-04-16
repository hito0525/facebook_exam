class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
     @topic = Topic.new
  end

  def create
      Topic.create(params[:Topic])
  end

  private
    def topics_params
      params.require(:topic).permit(:title, :content)
    end

end
