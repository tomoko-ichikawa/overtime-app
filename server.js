const express = require('express');
const port = process.env.PORT || 8080;
const app = express();
// app.use('/static', express.static(__dirname + '/public'));
// app.listen(port);

if(process.env.NODE.ENV === 'production') {
  app.use(express.static(path.join(__dirname, 'front_end', 'build')));

  app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'front_end', 'build', 'index.html'))
  });
  
}