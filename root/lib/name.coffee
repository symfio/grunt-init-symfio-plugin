module.exports = (container, callback) ->
  response = container.get "ping response", "pong"
  logger = container.get "logger"
  app = container.get "app"

  logger.info "loading plugin", "{%= plugin_name %}"

  app.use (req, res, callback) ->
    return callback() unless req.method is "GET"
    return callback() unless req.url is "/ping"

    res.send 200, response

  callback()
