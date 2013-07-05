# symfio-{%= plugin_name %}

> {%= description %}

## Usage

```coffee
symfio = require "symfio"

container = symfio "example", __dirname

container.set "pingResponse", "It's works!"

container.inject require "symfio-contrib-express"
container.inject require "symfio-{%= plugin_name %}"
```

## Dependensies

* [contrib-express](https://github.com/symfio/symfio-contrib-express)

## Configuration

### `pingResponse`

Default value is `pong`.

## Services

### `pingReply`

Ping reply function.
