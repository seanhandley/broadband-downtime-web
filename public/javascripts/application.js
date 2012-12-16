$(function() {
  var chart;
  $(document).ready(function() {
    chart = new Highcharts.Chart({
      chart: {
        renderTo: 'graph-stage',
        type: 'line',
        marginRight: 130,
        marginBottom: 50
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
        categories: $.parseJSON($.ajax({
          url: $('#graph-stage').data('xaxis-url'),
          async: false,
          dataType: 'json'
        }).responseText)
      },
      yAxis: {
        title: {
          text: '% downtime per day'
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
        data: $.parseJSON($.ajax({
          url: $('#graph-stage').data('plots-url'),
          async: false,
          dataType: 'json'
        }).responseText)
      }]
    });
  });
});
