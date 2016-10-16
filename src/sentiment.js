
module.exports = function(text, callback) {

  // callback check
  if (!callback) {
    console.log('You need to pass a callback with one parameter');
    return;
  }
  
  // import files
  const Language  = require('@google-cloud/language');
  const languageClient = Language({
    projectId: 'dubhacks2016'
  });
  
  // try to perform sentiment analysis
  try {
    languageClient.detectSentiment(text, { verbose: true }, function(err, sentiment) {
      if (err) {
        console.log(err);
        callback({ 'polarity': -1.0, 'magnitude': 200000000 });
      } else {
        callback(sentiment);
      }
    });
  } catch (e) {
    console.log(e);
    callback({ 'polarity': -1.0, 'magnitude': 200000000 });
  }
}
