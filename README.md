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
