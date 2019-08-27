$(document).ready(function(){

  console.log("working")

  const stock = $('.stock-data').data('stock-object');
  console.log(stock);
  const values = $('.stock-values').data('stock-values');
  console.log(values);
  const values_array = [];
  const log_time_array = [];
  values.forEach(function(value){
      values_array.push(value.price);
      log_time = new Date(value.log_time).toLocaleTimeString();
      log_time_array.push(log_time);
    });


  console.log(values_array);
  console.log(log_time_array);


  var ctx = document.getElementById('stock-chart').getContext('2d');
  Chart.defaults.global.elements.point.borderWidth = 0;
  Chart.defaults.global.animation.easing = 'linear';
  var chart = new Chart(ctx, {
      // The type of chart we want to create
      type: 'line',

      // The data for our dataset
      data: {
          labels: log_time_array,
          datasets: [{
              label: stock.symbol,
              backgroundColor: false,
              borderColor: 'rgb(77, 255, 171, 100)',
              data: values_array,
              // lineTension: 0
              // this removes points entirely
              // pointRadius: 1
          }]
      },

      // Configuration options go here
      options: {
        scaleBeginAtZero: false,
        responsive: true,
        scaleStartValue : -50,
        elements: {
          line: {
            backgroundColor: false,
            fill: false

          }
        },
        scales: {
          yAxes: [{
               ticks: {
                   // Include a dollar sign in the ticks
                   callback: function(value, index, values) {
                       return '$' + value;
                   }

               },
               gridLines:{
                 display: true,
                 color: "gray"
               }
           }],
           xAxes: [{
             gridLines:{
               display: true,
               color: "gray"
             }
           }]
        },
        legend: {
          display :false
        }

      }
  });



});
