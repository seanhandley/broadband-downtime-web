$(function() {
  var chart;
  $(document).ready(function() {
    chart = new Highcharts.Chart({
      chart: {
        renderTo: 'container',
        type: 'line',
        marginRight: 130,
        marginBottom: 25
      },
      title: {
        text: 'My Downtime',
        x: -20 //center
      },
      subtitle: {
        text: "Tessa's SKY data",
        x: -20
      },
      xAxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
      },
      yAxis: {
        title: {
          text: '% test failures'
        },
        plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
        }]
      },
      tooltip: {
        formatter: function() {
          return '<b>' + this.series.name + '</b><br/>' + this.x + ': ' + this.y + '% downtime per day';
        }
      },
      legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -10,
        y: 100,
        borderWidth: 0
      },
      series: [{
        name: 'Downtime',
        data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
      }]
    });
  });
});
