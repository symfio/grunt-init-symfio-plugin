suite = require "symfio-suite"


describe "{%= name %}()", ->
  it = suite.plugin [
    require ".."

    (container) ->
      container.set "get", (sandbox) ->
        sandbox.spy()
  ]

  describe "container.unless pingResponse", ->
    it "should have default value", (pingResponse) ->
      pingResponse.should.equal "pong"

  describe "container.set pingReply", ->
    it "should wrap respond text", (pingReply) ->
      pingReply().should.equal "Response is \"pong\""

  describe "get /ping", ->
    it "should define controller", (get) ->
      get.should.calledWith "/ping"
