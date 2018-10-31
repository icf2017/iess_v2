class ElectricityAnalysis

  setup: () ->
    document.getElementById("display_table").style.width = "15%"
    document.getElementById("results").style.width = "70%"
    document.getElementById("warning").style.width = "13%"
    target = $('#results')
    target.append("<div id='demand_analysis' class='all_energy_chart'></div>")
      .append("<div id='supply_analysis' class='all_energy_chart'></div>")

    document.getElementById("pathway_box").style.display = "block"
    document.getElementById("classic_controls").style.display = "block"
    document.getElementById("display_table").style.display = "block"
    document.getElementById("print_div").style.display = "none"
    document.getElementById("warning").style.display = "block"

    $('#display').empty()

    $('#display').append("<h5>Explore</h5><ul class='subnav'><li><a href='#' id='energy-subnav-1' class='btn btn-dark' onclick='twentyfifty.switchView(\"electricity\")'>Demand and Supply</a></li><li><a href='#' id='energy-subnav-2' class= 'btn btn-dark selected' onclick='twentyfifty.switchView(\"electricity_analysis\")'>Analysis of Electricity Share</a></li></ul>")


    document.getElementById("results").style.overflow = "inherit"

    @demand_analysis = new Highcharts.Chart({
      chart: {renderTo: 'demand_analysis', type: 'bar', height: 250, weight: 300, marginLeft: 70},
      title: {text: 'Electricity demand - Demand Interventions (2050) in TWh'},

      yAxis: {
        labels:
          formatter: ->
            return Math.round(this.value / 1) + ''
        title: null
      },

      xAxis: {
        categories: ['Transport', 'Industry', 'Cooking', 'Buildings', 'Agricuture'],
        labels:
          style: {
            color: '#000',
          },
          formatter: ->
            @value
      },

      plotOptions: {
        series: {
#stacking: 'normal',
          dataLabels: {
            enabled: true,
            color: 'black',
            formatter: () ->
              " #{Highcharts.numberFormat(this.y, 2)}"
          }
        }
      },

      series: []
    })

    @supply_analysis = new Highcharts.Chart({
      chart: {renderTo: 'supply_analysis', height: 250, width: 300},
      title: {text: 'Electricity supply'},
      tooltip: {
        enabled: true,
        formatter: () ->
          "<b>#{this.series.name}</b><br/><b>#{this.x}: #{Highcharts.numberFormat(this.y, 0)} TWh/yr </b>"
        style:
          fontSize: "9px"
          padding: "8px"
        positioner: ->
          x: 65
          y: 0
      },
      yAxis: {
        labels:
          formatter: ->
            return this.value / 1000 + 'k'
        title: {
          style: {
            fontWeight: "bold",
            color: "#154c85",
            fontSize: "10px"
          },
          align: "high",
          rotation: 0,
          textAlign: "left",
          x: 0,
          y: -10,
          text: "TWh/yr"
        },
        min: 0,
        max: 1000,
        width: 225
      },
      xAxis: {width: 240},
      legend: {
        itemStyle: {fontSize: '7pt'}
      },
      plotOptions:
        area:
          lineWidth: 0.1

        series:
          states:
            hover:
              enabled: true
              lineWidth: 2
              lineColor: "#6c6c6c"

          events:
            mouseOver: ->
              twentyfifty.highlightLegend "custom-legend1", this.index, true
              Ddata = [
                Highcharts.numberFormat(@yData[0], 0, ",")
                Highcharts.numberFormat(@yData[1], 0, ",")
                Highcharts.numberFormat(@yData[2], 0, ",")
                Highcharts.numberFormat(@yData[3], 0, ",")
                Highcharts.numberFormat(@yData[4], 0, ",")
                Highcharts.numberFormat(@yData[5], 0, ",")
                Highcharts.numberFormat(@yData[6], 0, ",")
                Highcharts.numberFormat(@yData[7], 0, ",")
              ]

              $("#display-data1 #SeriesName").html this.name

              i = 0

              while i < 8
                $("#display-data1 #SeriesData" + i).html Ddata[i]
                i++
              return

            mouseOut: ->
              twentyfifty.highlightLegend "custom-legend1", this.index, false
              i = 0

              while i < 8
                $("#display-data1 #SeriesData" + i).empty()
                i++
              $("#display-data1 #SeriesName").empty()
              return

      series: []
    })


  teardown: () ->
    $('#results').empty()
    @demand_analysis = null
    @supply_analysis = null


  updateResults: (@pathway) ->
    @setup() unless @demand_analysis? && @supply_analysis?


    # Demand for electricity
    titles = ['Transport', 'Industry', 'Cooking', 'Buildings', 'Pumps& Tractors']


    for name in titles
      data = @pathway['electricity']['demand'][name][7]


    data = [{y: @pathway['electricity']['demand']['Transport'][7], color: '#f44545'},
      {y: @pathway['electricity']['demand']['Industry'][7], color: '#CC6699'},
      {y: @pathway['electricity']['demand']['Cooking'][7], color: '#709d40'},
      {y: @pathway['electricity']['demand']['Buildings'][7], color: '#FF9900'},
      @pathway['electricity']['demand']['Pumps& Tractors'][7]]

    if @demand_analysis.series[0]?
      @demand_analysis.series[0].setData(data)
    else
      @demand_analysis.addSeries
        name: 'jsknsfs'
        data: data
      , false

    titles_supply = ["Gas Power Stations", "Coal power stations", "Carbon Capture Storage (CCS)",
      "Electricity Balancing Requirement", "Fossil Fuel Based Electricity", "Hydro and Nuclear",
      "Renewable Based Electricity", "Electricity imports"]

    i = 0

    data = @pathway['electricity']['supply']['Total generation supplied to grid']
    if @supply_analysis.series[i]?
      @supply_analysis.series[i].setData(data, false)
    else
      @supply_analysis.addSeries({
        type: 'line',
        name: 'Total supply',
        data: data,
        lineColor: '#000',
        color: '#000',
        lineWidth: 2,
        dashStyle: 'Dot',
        shadow: false
      }, false)
    i++

    for name in titles
      data = @pathway['electricity']['supply'][name]
      if @supply_analysis.series[i]?
        @supply_analysis.series[i].setData(data, false)
      else
        @supply_analysis.addSeries({name: titles_supply[i - 1], data: data}, false)
      i++

    @demand_analysis.redraw()
    @supply_analysis.redraw()

    document.getElementById("warning").innerHTML = "<p>This scenario is over generating <b>" + @pathway['electricity']['overgeneration']['Overgeneration'][7] + " TWh </b> of electricity in 2050. You may want to dial back your supply options for minimizing this value</p>"

window.twentyfifty.views['electricity_analysis'] = new ElectricityAnalysis
