express = require('express')
mongoose = require 'mongoose'
config = require './config'

app = express();

config.init(app)

console.log 'Listening on port ' + config.port
app.listen(config.port)
