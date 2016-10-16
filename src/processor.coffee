# Process images and videos with clarifai
# Process text with something else (google api?)

Clarifai = require('clarifai')

module.exports = (link, cb) ->
  app = new Clarifai.App(process.env.CLARIFAI_ID, process.env.CLARIFAI_SECRET)
  app.models.predict(Clarifai.NSFW_MODEL, link).then(
    (res) ->
<<<<<<< HEAD
      if (res.data.outputs[0].data.concepts[0].value >= 0.88)
=======
      percentageValue = 0;
      if (res.data.outputs[0].data.concepts[0].name == "sfw")
        console.log("sfw")
        percentageValue = res.data.outputs[0].data.concepts[0].value
        console.log(percentageValue)
      else
        console.log("nsfw")
        percentageValue = res.data.outputs[0].data.concepts[1].value
        console.log(percentageValue)
      if (percentageValue >= 0.85)
        console.log("true")
>>>>>>> update
        cb null, true
      else
        console.log("false")
        cb null, false
      # console.log res
    ,
    (err) -> cb null, false
      #
)

#safeOrNah('https://samples.clarifai.com/nsfw.jpg', (err, result) -> console.log result)

# coffee processor.coffee
