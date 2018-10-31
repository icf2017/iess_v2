Highcharts.setOptions({
  //colors: ['#0099CC', '#FF9933', '#009933', '#003366', '#FF5050', '#CC3300', '#CC0000', '#003366', '#FF6600'],
  //colors:["#DDDF0D", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
  //colors: ['#9ACD32', '#00FA9A', '#228B22', '#DC143C', '#FF4500', '#FFD700', '#008B8B', '#800080', '#663399','#00FFFF','#0000FF','#FF1493'],
  lang: {
    drillUpText: 'ffssd'
  },
  chart: {
    borderColor: '#ffffff',
    backgroundColor: '',
    //padding: 10,
    borderRadius: 'none',
    zoomType: 'xy',
    defaultSeriesType: 'area',
    animation: true,
    //spacingTop: 5,
    //spacingBottom: 10,
    //spacingBottom: 100,
    //spacingLeft: 3,
    //spacingRight: 5,
    margin: [45, 0, 16, 60],
    style: {fontFamily: 'sans-serif'}
  },
  title: {/*margin: 5*/},
  credits: {enabled: false},
  legend: {
    enabled: false,
    //layout: 'vertical',
    //align: 'left',
    verticalAlign: 'bottom',
    align: 'right',
    floating: true,
    backgroundColor: '#FFFFFF'
  },


  xAxis: {
    categories: [2015, 2020, 2025, 2030, 2035, 2040, 2045, 2050],
    tickWidth: 0,
    title: {enabled: false},
    labels: {
      formatter: function () {
        switch (this.value) {
          case 2015:
            return 2015;
            break;
          case 2020:
            return 2020;
            break;
          case 2025:
            return 2025;
            break;
          case 2030:
            return 2030;
            break;
          case 2035:
            return 2035;
            break;
          case 2040:
            return 2040;
            break;
          case 2045:
            return 2045;
            break;
          case 2050:
            return 2050;
            break;
        }
      },
      style: {
        color: '#000'
      },
      align: 'right'
    }
  },
  yAxis: {
    labels: {
      style: {
        color: '#000'
      },
      formatter: function () {
        return this.value / 1;
      }
    }
  },

  plotOptions: {
    area: {
      stacking: 'normal',
      animation: true,
      lineWidth: 1,
      shadow: false,
      lineColor: '#fff',
      marker: {
        enabled: false,
        states: {
          hover: {
            enabled: true,
            radius: 5
          }
        }
      }
    },
    line: {
      animation: true,
      shadow: false,
      marker: {
        enabled: false,
        states: {
          hover: {
            enabled: true,
            radius: 5
          }
        }
      }
    }
  }
});
