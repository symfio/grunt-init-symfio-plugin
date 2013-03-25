# symfio-{%= plugin_name %}

> {%= description %}

## Usage

```coffee
symfio = require "symfio"

container = symfio "example", __dirname
container.set "ping response", "It's works!"

loader = container.get "loader"

loader.use require "symfio-contrib-express"
loader.use require "symfio-{%= plugin_name %}"

loader.load()
```

## Required plugins

* [contrib-express](https://github.com/symfio/symfio-contrib-express)

## Can be configured

* __ping response__ — Default value is `pong`.
