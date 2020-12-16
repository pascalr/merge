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
  autoInsertRow: true,
  contextMenu: true,
  licenseKey: 'non-commercial-and-evaluation',
  afterChange: function (changes, source) {

    if (source === 'loadData') { return; /* don't save this change*/ }

    console.log("Source: ", source)

    changes.forEach(([row, prop, oldValue, newValue]) => {
      let id = hot.getDataAtCell(row, 0);
      let columnName = headers[prop]
      if (id == null) {
        // Create model
        $.ajax({
          type: "POST",
          url: "/" + tablename,
          data: {
            authenticity_token: $('[name="csrf-token"]')[0].content,
            [model]: {[columnName]: newValue}
          },
          success: function (data) {console.log("success data: ", data); return false},
          error: function (data) {console.log("error data: ", data); return false}
        })
        hot.setDataAtCell(row, 0, 123);
      } else {
        let allNull = false
        if (newValue == null == newValue == "") {
          allNull = true
          for (let i = 1; i < headers.length; i++) {
            let v = hot.getDataAtCell(row, i)
            if (v && headers[i] !== "created_at" && headers[i] !== "updated_at") {
              console.log("Found not empty: ", v);
              allNull = false
            }
          }
        }
        // Delete model
        if (allNull) {
          $.ajax({
            type: "DELETE",
            url: "/" + tablename + "/" + id + "?no_redirect=true",
            data: {
              authenticity_token: $('[name="csrf-token"]')[0].content,
            },
            success: function (data) {console.log("success data: ", data); return false},
            error: function (data) {console.log("error data: ", data); return false}
          })
        // Update model
        } else {
          $.ajax({
            type: "PATCH",
            url: "/" + tablename + "/" + id,
            data: {
              authenticity_token: $('[name="csrf-token"]')[0].content,
              [model]: {[columnName]: newValue}
            },
            success: function (data) {console.log("success data: ", data); return false},
            error: function (data) {console.log("error data: ", data); return false}
          })
        }
      }
      // TODO: Set updated_at and created_at (non fuck off je ne mettrai n'afficherai tout simplement pas ces valeurs)
      console.log("tablename: ", tablename);
      console.log("id: ", id);
      console.log("columnName: ", columnName);
      console.log("value: ", newValue);
    });
  }
});
