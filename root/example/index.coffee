symfio = require "symfio"

module.exports = container = symfio "example", __dirname
loader = container.get "loader"

loader.use require "symfio-contrib-express"
loader.use require "../lib/{%= clean_name %}"
loader.load() if require.main is module
