symfio = require "symfio"
plugin = require "../lib/{%= clean_name %}"
suite = require "symfio-suite"


describe "{%= plugin_name %} plugin", ->
  wrapper = suite.sandbox symfio, ->
    @app = use: @sandbox.stub()
    @container.set "app", @app

  it "should inject express middleware", wrapper ->
    plugin @container, ->

    @expect(@app.use).to.have.been.calledOnce
