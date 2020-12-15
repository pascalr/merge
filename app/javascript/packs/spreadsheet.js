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
let headers = JSON.parse(container.dataset.spreadsheetheaders)
let tablename = container.dataset.spreadsheettablename
let model = container.dataset.spreadsheetmodel
let columns = headers.map((h) => ({readOnly: h == "id" || h == "created_at" || h == "updated_at"}))

const hot = new Handsontable(container, {
  data: data,
  rowHeaders: true,
  colHeaders: headers,
  columns: columns,
  fixedRowsTop: 1,
  allowInsertRow: true,
  contextMenu: true,
  licenseKey: 'non-commercial-and-evaluation',
  afterChange: function (changes, source) {

    if (source === 'loadData') { return; /* don't save this change*/ }

    console.log("Source: ", source)

    changes.forEach(([row, prop, oldValue, newValue]) => {
      let id = hot.getDataAtCell(row, 0);
      let columnName = headers[prop]
      if (id == null) {
        // Create new model
        1
        console.log('Data: ');
        console.log(JSON.stringify(hot.getData()));
        let post_data_value = {}
        post_data_value[columnName] = newValue
        let post_data = {}
        post_data.authenticity_token = $('[name="csrf-token"]')[0].content
        post_data[model] = post_data_value
        $.ajax({
          type: "POST",
          url: "/" + tablename,
          data: post_data,
          success: function (data) {console.log("success data: ", data); return false},
          error: function (data) {console.log("error data: ", data); return false}
        })
        hot.setDataAtCell(row, 0, 123);
      } else {
        // Update model
  
        // TODO: Check if all the values are null. If so, delete the record
      }
      // TODO: Set updated_at and created_at (non fuck off je ne mettrai n'afficherai tout simplement pas ces valeurs)
      console.log("tablename: ", tablename);
      console.log("id: ", id);
      console.log("columnName: ", columnName);
      console.log("value: ", newValue);
    });
    //if (!autosave.checked) {
    //  return;
    //}
    //clearTimeout(autosaveNotification);
    //ajax('scripts/json/save.json', 'GET', JSON.stringify({data: change}), function (data) {
    //  exampleConsole.innerText  = 'Autosaved (' + change.length + ' ' + 'cell' + (change.length > 1 ? 's' : '') + ')';
    //  autosaveNotification = setTimeout(function() {
    //    exampleConsole.innerText ='Changes will be autosaved';
    //  }, 1000);
    //});
  }
});

const save = document.getElementById('save_spreadsheet');
Handsontable.dom.addEvent(save, 'click', function() {
  // save all cell's data
  console.log('Data: ');
  console.log(JSON.stringify(hot.getData()));
  $.ajax({
      type: "POST",
      url: "/database/save_all.json",
      data: { authenticity_token: $('[name="csrf-token"]')[0].content, values: hot.getData()},
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
