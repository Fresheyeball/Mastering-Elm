const
  exec          = require('child_process').exec
, watch         = require('watch-fs').Watcher
, serveStatic   = require('serve-static')
, finalhandler  = require('finalhandler')
, http          = require('http')
, serve         = require('serve-static')
, port          = 8000
, buildElm      = () => exec(
    'elm make src/Main.elm --output static/main.js --debug && ' +
    'cat src/Audio.js >> static/main.js && ' +
    'cat src/Main.js >> static/main.js' ,
    (err) => err ? console.log(err) : {})

http
  .createServer((req, res) =>
    serve('static')(req, res, finalhandler(req, res)))
  .listen(port)

console.log(`Ear is pressed to door of room ${port}`)

buildElm()

watch
  ({ paths: 'src' })
  .on('change', buildElm)
  .start(() => {})
