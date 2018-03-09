class PrimaryEnergy

  constructor: () ->

  setup: () ->
    $('#energy_container').empty()
    document.getElementById("results").style.width = "75%"
    document.getElementById("warning").style.width = "13%"
    $('#results').append("<div id='energy_container'></div>")
    target = $('#energy_container')
    target.append("<div id='demand_chart' class='chart'></div>")
    target.append("<div id='supply_chart' class='chart'></div>")
    target.append("<div id='dependency_chart' class='chart'></div>")

    document.getElementById("pathway_box").style.display = "block"
    document.getElementById("classic_controls").style.display = "block"
    document.getElementById("display_table").style.display = "block"
    document.getElementById("print_div").style.display = "none"
    document.getElementById("warning").style.display = "block"

    $('#display').empty()
 
    $('#display').append("<h5>Explore</h5><ul class='subnav'><li><a href='#' id='energy-subnav-1' class='selected' onclick='twentyfifty.switchView(\"primary_energy_chart\")'>Energy Demand & Supply</a></li><li><a href='#' id='energy-subnav-2' class='' onclick='twentyfifty.switchView(\"primary_energy_overview_chart\")'>Sector-wise Drilldown</a></li><li><a href='#' id='energy-subnav-3' class='' onclick='twentyfifty.switchView(\"primary_energy_detail_chart\")'>Compare 2012 and 2047</a></li></ul>")
        
    document.getElementById("results").style.overflow = "inherit"

    @final_energy_chart = new Highcharts.Chart({
      chart: { renderTo: 'demand_chart', height: 250 },
      title: { text: 'Energy Demand' },
      yAxis: {
        labels: formatter: ->
          return Math.round(this.value/1000) + 'k'

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
        max: 24000
      },
      xAxis:{width:240},
      legend:{
        itemStyle: { fontSize: '7pt' }
      },
      tooltip:{
        enabled: true,
        formatter: () ->
          "<b>#{this.series.name}</b><br/><b>#{this.x}: #{Highcharts.numberFormat(this.y,0)} TWh/yr </b>"
        style:
          fontSize: "9px"
          padding: "8px"
        positioner: ->
          x: 65
          y: 0
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
              twentyfifty.highlightLegend "custom-legend0", this.index, true
              Ddata = [
                Highcharts.numberFormat(@yData[0], 0, ",")
                Highcharts.numberFormat(@yData[3], 0, ",")
                Highcharts.numberFormat(@yData[5], 0, ",")
                Highcharts.numberFormat(@yData[7], 0, ",")
              ]
              $("#display-data0 #SeriesName").html this.name
              i = 0
              
              while i < 4
                $("#display-data0 #SeriesData" + i).html Ddata[i]
                i++
              return
              
            mouseOut: ->
              twentyfifty.highlightLegend "custom-legend0", this.index, false
              i = 0

              while i < 4
                $("#display-data0 #SeriesData" + i).empty()
                i++
              $("#display-data0 #SeriesName").empty()
              return

      series: []
    })
    @primary_energy_chart = new Highcharts.Chart({
      chart: { renderTo: 'supply_chart', height: 250, width: 300  },
      title: { text: 'Energy Supply' },
      tooltip:{
        enabled: true,
        formatter: () ->
          "<b>#{this.series.name}</b><br/><b>#{this.x}: #{Highcharts.numberFormat(this.y,0)} TWh/yr </b>"
        style:
          fontSize: "9px"
          padding: "8px"
        positioner: ->
          x: 65
          y: 0
      },
      yAxis: {
        labels: formatter: ->
          return Math.round(this.value/1000) + 'k'

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
        max: 40000, 
        width: 225 
      },
      xAxis:{ width: 240},
      legend:{
        itemStyle: { fontSize: '7pt' }
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
                Highcharts.numberFormat(@yData[3], 0, ",")
                Highcharts.numberFormat(@yData[5], 0, ",")
                Highcharts.numberFormat(@yData[7], 0, ",")
              ]

              $("#display-data1 #SeriesName").html this.name

              i = 0

              while i < 4
                $("#display-data1 #SeriesData" + i).html Ddata[i]
                i++
              return

            mouseOut: ->
              twentyfifty.highlightLegend "custom-legend1", this.index, false
              i = 0

              while i < 4
                $("#display-data1 #SeriesData" + i).empty()
                i++
              $("#display-data1 #SeriesName").empty()
              return

      series: []
    })

    @dependency_chart = new Highcharts.Chart({
      chart: {
        renderTo: 'dependency_chart',
        type: 'line',
        height: 250,
        width: 300 
        #events:
        #  load: () ->
        #    @renderer.text("80% reduction on 1990" ,60,170).css({color: '#fff',fill: '#fff', 'font-size': '0.75em'}).attr({zIndex:10}).add()

      },
      title: { text: 'Import Dependence' },
      tooltip:{
        enabled: true,
        formatter: () ->
          "<b>#{this.series.name}</b><br/><b>#{this.x}: #{Highcharts.numberFormat(this.y,0)} % </b>"
        style:
          fontSize: "9px"
          padding: "8px"
        positioner: ->
          x: 65
          y: 0
      },
      yAxis: {
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
          text: "Percentage"
        },  
        min: 0, 
        max: 100, 
        width: 225 
      },
      xAxis: {
        width: 240,       
        value: (148400),
        dashStyle: 'longdashdot',
	
      },
      legend:{
        itemStyle: { fontSize: '7pt' }
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
              twentyfifty.highlightLegend "custom-legend2", this.index, true
              Ddata = [
                Highcharts.numberFormat(@yData[0], 0, ",")
                Highcharts.numberFormat(@yData[3], 0, ",")
                Highcharts.numberFormat(@yData[5], 0, ",")
                Highcharts.numberFormat(@yData[7], 0, ",")
              ]
              $("#display-data2 #SeriesName").html this.name

              i = 0

              while i < 4
                $("#display-data2 #SeriesData" + i).html Ddata[i]
                i++
              return

            mouseOut: ->
              twentyfifty.highlightLegend "custom-legend2", this.index, false
              i = 0

              while i < 4
                $("#display-data2 #SeriesData" + i).empty()
                i++

              $("#display-data2 #SeriesName").empty()
              return

      series: []

    })


  teardown: () ->
    $('#results').empty()
    $('#energy_container').empty()
    @final_energy_chart = null
    @primary_energy_chart = null
    @dependency_chart = null

  updateResults: (@pathway) ->
    console.log @pathway
    @setup() unless @dependency_chart? && @final_energy_chart? && @primary_energy_chart?

    titles_dependency = ['Coal',
                         'Oil',
                        'Gas',
                        'Overall',
    ]

    i = 0
    for name in titles_dependency
      data = @pathway['dependency'][name]

      # data contains 0.1 for 10%, so multiply by 100 for charting
      data = ((d*100) for d in data)

      if @dependency_chart.series[i]?
        @dependency_chart.series[i].setData(data,false)
      else
        @dependency_chart.addSeries({name:name,data:data},false)
      i++

    # The fourth in the series is the total, so we want to make it blacker, thicker and more dotted
    # than the other lines
    @dependency_chart.series[3].color = "#000000"
    @dependency_chart.series[3].options.lineWidth = 3
    @dependency_chart.series[3].options.dashStyle = "longdashdot"


    titles = ["Telecom","Transport","Industry","Cooking","Buildings","Pumps& Tractors"]
    i = 0


    # Set this in the context of the do nothing total
    data = @pathway['Determined_effort_demand']["Determined Effort"]
    if @final_energy_chart.series[i]?
      @final_energy_chart.series[i].setData(data,false)
    else
      @final_energy_chart.addSeries({type: 'line', name: 'Determined Effort',data:data, lineColor: '#FF0000', color: '#FF0000',lineWidth:2,dashStyle:'Dot', shadow: false},false)
    i++

    data = @pathway['final_energy_demand']["Scenario Demand"]
    if @final_energy_chart.series[i]?
      @final_energy_chart.series[i].setData(data,false)
    else
      @final_energy_chart.addSeries({type: 'line', name: 'Total demand',data:data, lineColor: '#000', color: '#000',lineWidth:2, shadow: false},false)
    i++


    for name in titles
      data = @pathway['final_energy_demand'][name]
      if @final_energy_chart.series[i]?
        @final_energy_chart.series[i].setData(data,false)
      else
        @final_energy_chart.addSeries({name:name,data:data},false)
      i++


    titles =["Bioenergy","Renewables and Clean Energy","Electricity oversupply (imports)","Coal","Oil and petroleum products","Natural gas",]

    titles_legend =["Bioenergy","Renewables and Clean Energy","Cross Border Electricity Trade","Coal","Oil","Natural gas",]
    i = 0

    # Set this in the context of the do nothing total
    data = @pathway['Determined_effort_supply']["Determined Effort"]
    
    if @primary_energy_chart.series[i]?
      @primary_energy_chart.series[i].setData(data,false)
    else
      @primary_energy_chart.addSeries({type: 'line', name: 'Determined Effort',data:data, lineColor: '#FF0000', color: '#FF0000',lineWidth:2,dashStyle:'Dot', shadow: false},false)
    i++

    data = @pathway['primary_energy_supply']["Total Primary Supply"]
    if @primary_energy_chart.series[i]?
      @primary_energy_chart.series[i].setData(data,false)
    else
      @primary_energy_chart.addSeries({type: 'line', name: 'Total supply',data:data, lineColor: '#000', color: '#000',lineWidth:2, shadow: false},false)
    i++


    for name in titles
      data = @pathway['primary_energy_supply'][name]

      if @primary_energy_chart.series[i]?
        @primary_energy_chart.series[i].setData(data,false)
      else
        @primary_energy_chart.addSeries({name:titles_legend[i-2],data:data},false)
      i++


    ########## **************** Start Custom Legand ***************** ##########     

##### Created an array ChartArr, optionsArr, chartIdArr to get the data of series , legand and chart id to create custom legand

    ChartArr = [
      @final_energy_chart.series
      @primary_energy_chart.series
      @dependency_chart.series
    ]

    optionsArr = [
      @final_energy_chart.options.legend
      @primary_energy_chart.options.legend
      @dependency_chart.options.legend
    ]
    chartIdArr = [
      "#demand_chart"
      "#supply_chart"
      "#dependency_chart"
    ]

##### calling common layout of legand

    twentyfifty.callCommon chartIdArr

##### Creating legand
##### Display data of corresponding series on mouse over on legand item
##### On mouse over respective series will highlight and other will fade out
##### Data will display on mouse over on series area 

    L = 0
    K = 0
    charts_id = []
    while L < 3
      chartSeries = []
      chartSeries = ChartArr[L]
      options = optionsArr[L]

      twentyfifty.callLegand options, chartSeries, L, null

      parentElement = $(chartIdArr[L])[0]
      charts_id.push parentElement.children[0].id

      L++

    $("#custom-legend2 legend-item0").css width:'50px'; 
    $("#custom-legend2 legend-item0").css float:'left'; 

####### .view is a class of 'View All' item in legand list. #######
    i = 0
    $('.view0').click ->

      twentyfifty.ViewAllSeries ChartArr[0], "view0", "viewAll"

      return

    $('.view1').click ->

      twentyfifty.ViewAllSeries ChartArr[1], "view1", "viewAll"

      return

    $('.view2').click ->

      twentyfifty.ViewAllSeries ChartArr[2], "view2", "viewAll"

      return

######### End View  All click function ######################

########### This is for legand list visibilite on mouse over and mouse out ##################

    $("#"+charts_id[0]).mouseover ->
      $("#custom-legend0").css visibility: "visible"
      $("#custom-legend0").css opacity: "0.9"
    $("#"+charts_id[0]).mouseout ->
      $("#custom-legend0").css visibility: "hidden"
      $("#custom-legend0").css opacity: 0

    $("#"+charts_id[1]).mouseover ->
      $("#custom-legend1").css visibility: "visible"
      $("#custom-legend1").css opacity: "0.9"
    $("#"+charts_id[1]).mouseout ->
      $("#custom-legend1").css visibility: "hidden"
      $("#custom-legend1").css opacity: 0
   
    $("#"+charts_id[2]).mouseover ->
      $("#custom-legend2").css visibility: "visible"
      $("#custom-legend2").css opacity: "0.9"
    $("#"+charts_id[2]).mouseout ->
      $("#custom-legend2").css visibility: "hidden"
      $("#custom-legend2").css opacity: 0

######### End mouse over and nouse out code ######################


    ########## **************** End Custom Legand ***************** #############    
    
    @dependency_chart.redraw()
    @final_energy_chart.redraw()
    @primary_energy_chart.redraw()
        

    document.getElementById("warning").innerHTML="<p>This scenario is over generating <b>"+@pathway['electricity']['overgeneration']['Overgeneration'][7]+" TWh </b> of electricity in 2047. You may want to dial back your supply options for minimizing this value</p>"
    

window.twentyfifty.views['primary_energy_chart'] = new PrimaryEnergy
