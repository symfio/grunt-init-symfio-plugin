module.exports.description = "Create a Symfio plugin."

module.exports.warnOn = "*"

module.exports.template = (grunt, init, callback) ->
  prompts = [
    {
      name: "plugin_name"
      message: "Plugin name"
      default: "contrib-ping"
    }
    init.prompt "version"
    init.prompt "description"
    init.prompt "author_name"
    init.prompt "author_email"
    {
      name: "copyrights"
      message: "Copyrights"
      default: "2012-2013 Rithis Studio LLC"
    }
  ]

  init.process {}, prompts, (err, props) ->
    contrib = /^contrib-/

    props.contrib = contrib.test props.plugin_name
    props.clean_name = props.plugin_name.replace contrib, ""

    files = init.filesToCopy props

    init.copyAndProcess files, props

    callback()
