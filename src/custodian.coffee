scraper = require "./scraper"
processor = require "./processor"
sentiment = require "./sentiment"
async = require "async"

module.exports = (subreddit, cb) ->
  scraper subreddit, (err, results) ->
    # call processor with results
    imgTransformer = (item, cb2) ->
      urls = []
      urls.push item.thumbnail
      # Now add preview.images urls to images
      if item?.preview?
        for image in item.preview.images
          urls.push image.source.url

      markSafe = (item2, cb3) ->
        processor item2, (err, result2) ->
          cb3 null, result2

      async.map urls, markSafe, (err, results) ->
        # results are booleans
        item.nsfw = true
        for elem in results
          if elem is true
            item.nsfw = false

        cb2 err, item


    async.map results, imgTransformer, (err, modResults) ->

      #cb err, modResults
      textTransformer = (item3, cb4) ->
        text = item3.selftext + item3.title
        sentiment text, (err, values) ->
<<<<<<< HEAD
          if values.polarity < -0.5 and !item3.nsfw
=======
          console.log values
          if (values.polarity < -99.0 and values.magnitude > 100) and (!item3.nsfw)
>>>>>>> update
            item3.nsfw = true
          cb4 null, item3

      async.map modResults, textTransformer, (err, finalResults) ->
        cb err, finalResults








      # process the image urls in posts

#scraper "funny", (err, results) -> console.log(results[2])
