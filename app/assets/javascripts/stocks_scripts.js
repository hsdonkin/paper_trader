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
      log_time = new Date(value.log_time).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
      log_time_array.push(log_time);
    });

    let borderColor = "";
    if (stock.gain === true) {
       borderColor = 'rgb(77, 255, 171, 100)';
    }else{
       borderColor = 'rgb(255, 122, 77, 100)';
    }



    console.log(values_array);
    console.log(log_time_array);


    var ctx = document.getElementById('stock-chart').getContext('2d');
    Chart.defaults.global.elements.point.borderWidth = 0;
    Chart.defaults.global.animation.easing = 'linear';
    Chart.defaults.global.animation.duration = 500;
    var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'line',

        // The data for our dataset
        data: {
            labels: log_time_array,
            datasets: [{
                label: stock.symbol,
                backgroundColor: false,
                borderColor: borderColor,
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
