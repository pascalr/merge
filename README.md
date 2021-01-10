I am legend

TODO: Start by doing TODO properly. All with js. No redirect? How to handle models?

TODO: It must be really easy to do a document and add other documents in it.

So for example, a document introduction, a spreadsheet, and some more text, you add those three files together in a erb master file!

TODO: Allow a lot of templating engine. Currently I am only rendering server side (erb), but latter render client side.
Client side rendering allows for realtime updating previews.
See: https://expressjs.com/en/resources/template-engines.html

Unfortunately, the view is rendered server side (ruby). It could be in real time if the view was rendered in the client side (js).

But then how to use the database?

I don't know. Maybe it's fine like this. And it can be real time was ran locally. Then there could be something to sync the databases.

TODO: Add a minimum inactive delay before update partial. So not updating for nothing at every keystroke when writing.

Also, when editing, don't send the whole document everytime. Only changes.


app.get('/resizeImages', function(req,res) {
  exec("find ../recettesPascal/images -iname '*.jpg' -exec convert \\{} -verbose -resize 400x400\\> \\{} \\;", function(err, stdout, stderr) {
  })
  exec("find ../recettesPascal/images -iname '*.png' -exec convert \\{} -verbose -resize 400x400\\> \\{} \\;", function(err, stdout, stderr) {
  })
  res.end('done')
})

COMMANDS = {
  ls: {cmd: "ls -la"},
  firefox: {cmd: "firefox"},
  resetSound: {cmd: "pulseaudio -k && sudo alsa force-reload"},
  dota2: {cmd: "steam steam://rungameid/570"},
  civ6: {cmd: "steam steam://rungameid/289070"},
  csgo: {cmd: "steam steam://rungameid/730"},
  chromium: {cmd: "chromium-browser"},
  freecad: {cmd: "freecad"},
  marioKart: {cmd: "dolphin-emu --exec='/home/pascalr/games/Mario Kart Wii.wbfs'"},
  // FIXME: SANITIZE INPUT
  setVolume: {fn: (query) => (`for SINK in \`pacmd list-sinks | grep 'index:' | cut -b12-\`
do
  pacmd set-sink-volume $SINK ${query.volume}
done`)},
  arduino: {fn: (query) => (`echo ${query.cmd} > /dev/ttyACM0`)}
}

INSTALL:

sudo apt-get update
sudo apt-get install libpq-dev postgresql postgresql-contrib
sudo service postgresql start
sudo -u postgres createuser --interactive
=> linux username, y

yarn install handsontable

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
