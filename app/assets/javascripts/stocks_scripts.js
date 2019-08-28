$(document).on('turbolinks:load',function(){

// weird solution to check if something exists
if ($('.chart-holder').length){

  // this gets the stock object from the data hidden in the div
  const stock = $('.stock-data').data('stock-object');




  // make an array of all the values for the chart data
  // this gets the values from the data hidden in the div
  const values_times = Array.from($('.stock-values-times').data('stock-values-times'));
  const values_object = $('.stock-values-object').data('stock-values-object');
  const values_array = [];
  const log_time_array = [];

  values_object.forEach(function(value){
      values_array.push(parseFloat(value.price));
    });
  values_times.forEach(function(time){
    time = time.replace("UTC", "");
    log_time_array.push(time);
  });
  values_array.reverse();
  log_time_array.reverse();

    // sort the values array and return the min max value
    values_sort = values_array.slice(0);
    valueMin = values_sort.sort(function(a, b){return a-b})[0];
    // max value is the last item of this array
    valueMax = values_sort[values_sort.length-1];




    // define border color based on gain or loss
    let borderColor = "";
    if (stock.gain === true) {
       borderColor = 'rgb(77, 255, 171, 100)';
    }else{
       borderColor = 'rgb(255, 122, 77, 100)';
    }


    // below is the chart object
    // ctx is the canvas element
    var ctx = document.getElementById('stock-chart').getContext('2d');
    Chart.defaults.global.elements.point.borderWidth = 0;
    Chart.defaults.global.animation.easing = 'linear';
    Chart.defaults.global.animation.duration = 1000;
    Chart.defaults.global.hover.animationDuration = 0;
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
            },
          tooltips: {
            // callback for the tooltip data would go here, but can't figure it out yet
          }

          },
          scales: {
            yAxes: [{
                 ticks: {
                     // Include a dollar sign in the ticks
                     callback: function(value, index, values) {
                         return '$' + value;
                     },
                     // this determines the min max of Y axis
                     suggestedMin: (valueMin - valueMin*0.005),
                     suggestedMax: (valueMax + valueMax*0.005)
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



}

  });
