require('jquery')

import Handsontable from "handsontable";
import 'handsontable/dist/handsontable.full.css';

//const data = [
//  ['', 'Tesla', 'Volvo', 'Toyota', 'Ford'],
//  ['2019', 10, 11, 12, 13],
//  ['2020', 20, 11, 14, 13],
//  ['2021', 30, 15, 12, 13]
//];

const container = document.getElementById('example');

let data = JSON.parse(container.dataset.spreadsheetvalues)

const hot = new Handsontable(container, {
  data: data,
  rowHeaders: true,
  colHeaders: true,
  fixedRowsTop: 1,
  allowInsertRow: true,
  contextMenu: true,
  licenseKey: 'non-commercial-and-evaluation'
});

const save = document.getElementById('save_spreadsheet');
Handsontable.dom.addEvent(save, 'click', function() {
  // save all cell's data
  console.log('Data: ');
  console.log(JSON.stringify(hot.getData()));
  Rails.ajax({
      type: "POST",
      url: "/database/save_all.json",
      data: hot.getData(),
      success: function (data) {return false},
      error: function (data) {return false}
    })
  //$.ajax('database/save_all.json', 'GET', JSON.stringify({data: hot.getData()}), function (res) {
  //  var response = JSON.parse(res.response);

  //  if (response.result === 'ok') {
  //    // exampleConsole.innerText = 'Data saved';
  //  }
  //  else {
  //    // exampleConsole.innerText = 'Save error';
  //  }
  //});
});
