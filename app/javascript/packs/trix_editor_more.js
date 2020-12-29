//global.Trix = require("trix")
//require("@rails/actiontext")

//attachment = new Trix.Attachment({content: <span style='color: red;'>Test1212</span>})
//embed = '<iframe width="420" height="315" src="https://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>'
embed = '<iframe width="420" height="315" src="https://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>'
element = document.querySelector('trix-editor')
//embed = "<span style='color: red;'>Test1212</span>"
attachment = new Trix.Attachment({content: embed})
element.editor.insertAttachment(attachment)
