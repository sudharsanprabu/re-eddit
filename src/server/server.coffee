# Express server to serve reddit posts

express = require 'express'
custodian = require '../custodian'

app = express()

app.get '/', (req, res) ->
  res.send 'Hello world!'

app.get '/:subreddit', (req, res) ->
  name = req.params.subreddit
  custodian name, (err, results) ->
    res.json(results)

app.listen 8080
