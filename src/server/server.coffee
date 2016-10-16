# Express server to serve reddit posts

express = require 'express'

app = express()

app.get '/', (req, res) ->
  res.send 'Hello world!'

app.listen 8080
