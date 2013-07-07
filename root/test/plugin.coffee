suite = require "symfio-suite"


describe "{%= name %}()", ->
  it = suite.plugin (container, containerStub) ->
    container.set "get", (sandbox) ->
      sandbox.spy()

    container.inject (get) ->
      require("..") containerStub, get

  describe "container.unless pingResponse", ->
    it "should have default value", (containerStub) ->
      containerStub.unless.get("pingResponse").should.equal "pong"

  describe "container.set pingReply", ->
    it "should wrap respond text", (containerStub, logger) ->
      factory = containerStub.set.get "pingReply"
      pingReply = factory "test", logger
      pingReply().should.equal "Response is \"test\""

  describe "get /ping", ->
    it "should define controller", (get) ->
      get.should.calledWith "/ping"
