HTMLWidgets.widget({

  name: 'iriswidget',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.

        //el.innerText = x.message;
        console.log("hi!");
        //var reader = new FileReader();
        //reader.readAsBinaryString(x.data);
        el = draw_plot();

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
