$(document).on('turbolinks:load',function(){

  // weird solution to check if something exists
  if ($('.welcome-chart-holder').length){
    console.log("making chart");
       let borderColor = 'rgb(77, 255, 171, 100)';
       var ctx = document.getElementById('welcome-chart').getContext('2d');
       Chart.defaults.global.legend.display = false;
       Chart.defaults.global.title.display = false;
      let chart = new Chart(ctx, {
       type: 'line',
       data: {
         labels: [1,2,3,4,5,6,7,8,9,10],
         datasets: [{
             data: [10,15,12,22,18,25,22,29,27,50],
             label: "Africa",
             borderColor: borderColor,
             fill: false,
             pointRadius: 0
           }
         ]
       },
       options: {
         title: {
           display: false,

         },
         scales: {
           yAxes: [{
                gridLines:{
                  display: false,
                  color: "gray"
                },
                ticks: {
                    display:false,
                  },
                  display:false
            }],
            xAxes: [{
              gridLines:{
                display: false,
                color: "gray"
              },
              ticks: {
                  display:false, // this here
                },
                display:false
            }]
         },
         tooltips: {enabled:false},
         hover: {mode:null}
       }
     });

  }

});
