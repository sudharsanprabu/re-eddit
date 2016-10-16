# Process images and videos with clarifai
# Process text with something else (google api?)

Clarifai = require('clarifai')

app = new Clarifai.App(process.env.CLARIFAI_ID, process.env.CLARIFAI_SECRET)

safeOrNah = (link, cb) ->
  app.models.predict(Clarifai.NSFW_MODEL, link).then(
    (res) ->
      if (res.data.outputs[0].data.concepts[0].value >= 0.85)
        cb null, true
      else
        cb null, false
      # console.log res
    ,
    (err) -> cb null, false
      #
)

safeOrNah('https://samples.clarifai.com/nsfw.jpg', (err, result) -> console.log result)

# coffee processor.coffee
