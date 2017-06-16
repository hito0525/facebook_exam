class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only:[:show,:edit, :update, :destroy]

  def index
    @topics = Topic.all
    @topics = Topic.order(:created_at).reverse_order
  respond_to do |format|
    format.html
      format.js
    end
  end
    #binding.pry
    #raise
 # showアククションを定義。入力フォームと一覧を表示するためインスタンスを2つ生成。
  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end


  def new
    if params[:back]
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end


  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
    redirect_to topics_path, notice: "トピックスを作成しました！"
    NoticeMailer.sendmail_topic(@topic).deliver
    else
    render 'new'
    end
  end

  def edit
  end

  def update
    if @topic.update(topics_params)
      redirect_to topics_path, notice: "トピックスを更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "トピックスを削除しました！"
  end

  def confirm
    @topic = Topic.new(topics_params)
  end


  private
    def topics_params
      params.require(:topic).permit(:title, :content)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
