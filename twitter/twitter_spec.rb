require "rspec"
require_relative "twitter"

RSpec.describe Twitter do
  let(:tw) { Twitter.new }

  describe "#post_tweet" do
    it "stores a user's tweet with recency ordering" do
      tw.post_tweet(1, 5)
      tw.post_tweet(1, 6)

      ids = tw.get_news_feed(1)
      expect(ids).to eq([6, 5])
    end
  end

  describe "#follow" do
    it "allows one user to follow another" do
      tw.follow(1, 2)
      tw.post_tweet(2, 5)

      expect(tw.get_news_feed(1)).to eq([5])
    end

    it "ignores duplicate follows" do
      tw.follow(1, 2)
      tw.follow(1, 2)

      tw.post_tweet(2, 5)
      expect(tw.get_news_feed(1)).to eq([5])
    end

    it "does not allow following yourself" do
      tw.follow(1, 1)

      tw.post_tweet(1, 5)
      expect(tw.get_news_feed(1)).to eq([5])
    end
  end

  describe "#unfollow" do
    it "removes a follow relation" do
      tw.follow(1, 2)
      tw.post_tweet(2, 5)

      expect(tw.get_news_feed(1)).to eq([5])

      tw.unfollow(1, 2)
      expect(tw.get_news_feed(1)).to eq([])
    end
  end

  describe "#get_news_feed" do
    it "returns most recent tweets across followees + self" do
      tw.post_tweet(1, 5)
      tw.post_tweet(2, 6)

      tw.follow(1, 2)

      expect(tw.get_news_feed(1)).to eq([6, 5])
    end

    it "merges tweets by timestamp, not by user order" do
      tw.post_tweet(1, 5)
      tw.post_tweet(2, 6)

      tw.follow(2, 1)
      tw.follow(1, 2)

      expect(tw.get_news_feed(1)).to eq([6, 5])
      expect(tw.get_news_feed(2)).to eq([6, 5])
    end

    it "limits the feed to 10 tweets" do
      12.times { |i| tw.post_tweet(1, i) }

      feed = tw.get_news_feed(1)
      expect(feed.length).to eq(10)
      expect(feed).to eq((11).downto(2).to_a)
    end

    it "handles the full mutual-follow test case from the prompt" do
      # ["Twitter","postTweet","follow","follow","getNewsFeed","postTweet","getNewsFeed",
      #  "getNewsFeed","unfollow","getNewsFeed","getNewsFeed","unfollow","getNewsFeed","getNewsFeed"]
      #
      # [[],[1,5],[1,2],[2,1],[2],[2,6],[1],[2],[2,1],[1],[2],[1,2],[1],[2]]

      tw.post_tweet(1, 5)
      tw.follow(1, 2)
      tw.follow(2, 1)

      expect(tw.get_news_feed(2)).to eq([5])

      tw.post_tweet(2, 6)
      expect(tw.get_news_feed(1)).to eq([6, 5])
      expect(tw.get_news_feed(2)).to eq([6, 5])

      tw.unfollow(2, 1)
      expect(tw.get_news_feed(1)).to eq([6, 5])
      expect(tw.get_news_feed(2)).to eq([6])

      tw.unfollow(1, 2)
      expect(tw.get_news_feed(1)).to eq([5])
      expect(tw.get_news_feed(2)).to eq([6])
    end
  end
end
