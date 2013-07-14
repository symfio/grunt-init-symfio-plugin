suite = require "symfio-suite"


describe "{%= name %}()", ->
  it = suite.plugin (container) ->
    container.set "get", (sandbox) ->
      sandbox.spy()

    container.inject ["suite/container", "get"], require ".."
    
    container.set "pingResponse", "test"

  describe "container.unless pingResponse", ->
    it "should have default value", (unlessed) ->
      factory = unlessed "pingResponse"
      factory().should.eventually.equal "pong"

  describe "container.set pingReply", ->
    it "should wrap respond text", (setted) ->
      factory = setted "pingReply"
      factory().then (pingReply) ->
        pingReply().should.equal "Response is \"test\""

  describe "get /ping", ->
    it "should define controller", (get) ->
      get.should.calledWith "/ping"
