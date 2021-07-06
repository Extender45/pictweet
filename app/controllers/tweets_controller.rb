class TweetsController < ApplicationController
  # before_action :onemore ,only:[:edit,:show]封印　内容：繰り返し使う内容のとき使うものらしいが少し不便だった。
  # before_action :move_to_index, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    # @tweets = Tweet.includes(:user)
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end
  def new
    @tweet = Tweet.new
  end
  def create
    Tweet.create(tweet_params)
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def edit
    @tweet = Tweet.find(params[:id])    
  end

  def show
    @tweet = Tweet.find(params[:id])    
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end
  private
  def tweet_params
    # params.require(:tweet).permit(:name,:image,:text)
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end
  # def onemore
  #   @tweet = Tweet.find(params[:id])   封印 
  # end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
