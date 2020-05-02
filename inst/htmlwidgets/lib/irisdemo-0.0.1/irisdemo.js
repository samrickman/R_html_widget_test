function draw_plot() {

    function draw_image(width = 480, height = 480){
      var myImage = new Image(width, height);
      //myImage.setAttribute(id, "the_image");
      myImage.src = 'http://directlabels.r-forge.r-project.org/docs/scatterplot/iris.ahull.grid.png';
      document.body.appendChild(myImage);
    }
    draw_image()
  var tooltip = $( '<div id="tooltip">' ).appendTo( 'body' )[0];
  $image = $('#htmlwidget_container');
  const iris_types = [
    ["setosa", 0],
    ["versicolor", 165],
    ["virginica", 308],
    ];
  imgPos = [
      $image.offset().left,
      $image.offset().top,
      $image.offset().left + $image.outerWidth(),
      $image.offset().top + $image.outerHeight()
  ];

  $image.mousemove(function(e){
    xcoord = e.pageX-imgPos[0];
    ycoord = e.pageY-imgPos[1];

  var i;
  for (i = 0; i < iris_types.length; i++) {
    //console.log(iris_types[i][1]);

    // Prevent index error if we get to the last value
    if (i==iris_types.length-1) {
      species = iris_types[i][0];
      break;
    }

    if (xcoord > iris_types[i][1] && xcoord < iris_types[i+1][1]) {
      species = iris_types[i][0];
      break;
    }
  }

    $('#coords').html((xcoord) +', '+ (ycoord));
    $( tooltip ).text(species).css({
                      left: xcoord,
                      top: ycoord
                  }).show();
    console.log(xcoord);
  });

}


function draw_plot_two(){
    function draw_image(width = 480, height = 480){
      var myImage = new Image(width, height);
      myImage.id = "the_image";
      myImage.src = 'http://directlabels.r-forge.r-project.org/docs/scatterplot/iris.ahull.grid.png';
      document.body.appendChild(myImage);
    }
    draw_image()
}


