$(document).ready(function(){

if ($('.sm-stock-chart').length) {
    let charts = Array.from($('.sm-stock-chart'));
    console.log(charts)


    let ctx = document.getElementById(charts[0].id);
    let chart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
          datasets: [{
            data: [86,114,106,106,107,111,133,221,783,2478],
            label: "Africa",
            borderColor: "#3e95cd",
            fill: false
          }
        ]
      },
      options: {
        title: {
          display: true,
          text: 'World population per region (in millions)'
        },
          bezierCurve: false, //remove curves from your plot
          scaleShowLabels : false, //remove labels
          tooltipEvents:[], //remove trigger from tooltips so they will'nt be show
          pointDot : false, //remove the points markers
          scaleShowGridLines: true //set to false to remove the grids background
        
      }
    });



}

})
