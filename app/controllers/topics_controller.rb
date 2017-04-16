class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topics = Topic.order(:created_at).reverse_order

  end

  def new
    @topic = Topic.new
  end

  def create
    Topic.create(topics_params)
    redirect_to topics_path, notice: "トピックスを作成しました！"
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic =Topic.find(params[:id])
    @topic.update(topics_params)
    redirect_to topics_path
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path,notice: "ブログを削除しました！"
  end

  private
    def topics_params
      params.require(:topic).permit(:title, :content)
    end
end
