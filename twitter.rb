class Twitter
  attr_accessor :tweets, :user_tweet, :users, :following

  def initialize
    @tweets = []
    @user_tweet = Hash.new { |h, k| h[k] = [] }
    @users = []
    @following = Hash.new { |h, k| h[k] = [] }
    @time = 0
  end

  def post_tweet(user_id, tweet_id)
    unless user_exists?(user_id)
      add_user(user_id)
    end

    @time += 1

    @user_tweet[user_id].unshift([tweet_id, @time])
    @tweets.unshift(tweet_id)
  end

  def get_news_feed(user_id)
    tweet_ids = []

    user_ids = following[user_id] + [user_id]

    user_ids.each do |uid|
      tweet_ids.concat(user_tweet[uid])
    end

    tweet_ids.sort_by! { |(_, time)| -time }
    tweet_ids.first(10).map(&:first)
  end

  def follow(follower_id, followee_id)
    return if follower_id == followee_id || @following[follower_id].include?(followee_id)

    @following[follower_id] << followee_id 
  end

  def unfollow(follower_id, followee_id)
    @following[follower_id].delete(followee_id)
  end

  private

  def user_exists?(user_id)
    @users.include?(user_id)
  end

  def add_user(user_id)
    @users << user_id
  end

  def user_has_followers?(user_id)
    following.key?(user_id) && following[user_id].any?
  end
end
