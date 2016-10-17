# Express server to serve reddit posts

express = require 'express'
custodian = require '../custodian'

app = express()

app.use express.static '../../public'

app.get '/:subreddit', (req, res) ->
  name = req.params.subreddit
  custodian name, (err, results) ->
    res.json(results)

app.listen 8080, () ->
  console.log 'running at localhost:8080'
