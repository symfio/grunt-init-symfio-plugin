symfio = require "symfio"
sinon = require "sinon"
chai = require "chai"


describe "{%= plugin_name %}()", ->
  chai.use require "chai-as-promised"
  chai.use require "sinon-chai"
  chai.should()

  container = null
  sandbox = null

  beforeEach (callback) ->
    container = symfio "test", __dirname
    sandbox = sinon.sandbox.create()

    container.set "get", ->
      sandbox.spy()

    container.injectAll([
      require ".."
    ]).should.notify callback

  afterEach ->
    sandbox.restore()

  describe "container.unless pingResponse", ->
    it "should have default value", (callback) ->
      container.get("pingResponse")
      .should.eventually.equal("pong").and.notify callback

  describe "container.set pingReply", ->
    it "should wrap respond text", (callback) ->
      container.get("pingReply").then (pingReply) ->
        pingReply().should.equal "Response is \"pong\""
      .should.notify callback

  describe "get /ping", ->
    it "should define controller", (callback) ->
      container.get("get")
      .should.eventually.calledWith("/ping").and.notify callback
