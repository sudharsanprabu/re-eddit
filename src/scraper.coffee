# Scrape reddit posts from a subreddit and return them
Snoowrap = require 'snoowrap'

module.exports = (subreddit, cb) ->
  reddit = new Snoowrap
    userAgent: process.env.REDDIT_USER_AGENT
    clientId: process.env.REDDIT_ID
    clientSecret: process.env.REDDIT_SECRET
    refreshToken: process.env.REDDIT_TOKEN

  reddit.getSubreddit(subreddit)
        .getHot({ limit: 10 })
        .then (res) ->
          cb null, res
