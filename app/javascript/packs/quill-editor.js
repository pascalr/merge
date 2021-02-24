import { DirectUpload } from "@rails/activestorage"
import ImageResize from "@taoqf/quill-image-resize-module/image-resize.min";
import Quill from 'quill/quill';
export default Quill;

document.addEventListener("DOMContentLoaded", function (event) {
  var quill = new Quill('#editor-container', {
    modules: {
      toolbar: [
        [{ header: [1, 2, false] }],
        ['bold', 'italic', 'underline'],
        ['image', 'code-block']
      ]
    },
    placeholder: 'Compose an epic...',
    theme: 'snow'
  });

  document.querySelector('form').onsubmit = function () {
    var body = document.querySelector('input[class=article-content]');
    body.value = quill.root.innerHTML
  };
});
