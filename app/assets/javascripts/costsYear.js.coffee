class costsYear

  constructor: () ->

  # Below is the slider html. Needs no changes.
  html = "
           <select id='year_range' name='year_range'>
             <option value='2015'>2015</option>
             <option value='2020'>2020</option>
             <option value='2025'>2025</option>
             <option value='2030'>2030</option>
             <option value='2035'>2035</option>
             <option value='2040'>2040</option>
             <option value='2045'>2045</option>
             <option value='2050' selected >2050</option>
           </select>

         "

  updateResults: (@pathway) ->
    
    @setup() unless @yearwise_chart? && @increamentalYear_chart?
    

    data_year = [2015,2020,2025,2030,2035,2040,2045,20450]
    data_y = []
    @SecYear = 'Total'    
    data = @pathway.increamental_year[window.twentyfifty.views.costsYear.SecYear]

    j = 0
    while j < data.length
      data_y.push([data_year[j], (Math.round(data[j]*100)/100)])
      j++
    
    if @yearwise_chart.series[0]?
      @yearwise_chart.series[0].setData(data_y,false)
    else
      @yearwise_chart.addSeries({name: 'Total', data:data_y, color: 'rgb(255, 146, 6)'},false)

    if window.yearwise.series[1]

       window.yearwise.series[1].remove(true)
       window.yearwise.setTitle({text: 'Total'})


    @curYear = '2050'
    data=[] 
    i=0
    while i < 8
      data.push([@pathway['increamental_table'][window.twentyfifty.views.costsYear.curYear][i][0], @pathway['increamental_table']['2050'][i][1]])
      i++
    if @increamentalYear_chart.series[0]?
      @increamentalYear_chart.series[0].setData(data,false)
    else
      @increamentalYear_chart.addSeries({name: 'Increamental Cost', data:data, color: 'rgb(247, 111, 111)', negativeColor:'rgb(136, 219, 5)'},false)      


    @yearwise_chart.redraw()
    @increamentalYear_chart.redraw()


  teardown: () ->
    #Return the results box to original position
    document.getElementById("results").style.width = "100%"
    document.getElementById("results").style.marginRight = "0"
    document.getElementById("results").style.overflow = "hidden"
    $('#results').empty()

    @yearwise_chart = null
    @increamentalYear_chart = null





  setup: () ->
    document.getElementById("results").style.width = "85%"
    target = $('#results')

    target.append("<div id='sector_increamental' class='chart'></div><div id='yearwise' style='float: right' class='chart'></div>")

    $('#results').append(html)


    document.getElementById("yearwise").style.width = "50%"
    document.getElementById("sector_increamental").style.width = "49%"

    document.getElementById("pathway_box").style.display = "block"
    document.getElementById("classic_controls").style.display = "block"
    document.getElementById("results").style.overflow = "inherit"
    document.getElementById("display_table").style.display = "block"
    document.getElementById("warning").style.display = "none"
    document.getElementById("print_div").style.display = "none" 
    document.getElementById("warning").style.display = "none"
    $('#warning').empty()
    $('#display').empty()
    $('#display').append("<h5>Explore</h5><ul class='subnav'><li><a href='#' id='energy-subnav-1' class='btn btn-dark' onclick='twentyfifty.switchView(\"total_cost\")'>Total Energy Cost</a></li><li><a href='#' class='btn btn-dark' id='energy-subnav-1' onclick='twentyfifty.switchView(\"costs\")'>Cost Overview</a></li><li><a href='#' id='energy-subnav-2' class='selected btn btn-dark' onclick='twentyfifty.switchView(\"costsYear\")'>Differential Cost</a></li></ul>")


    window.increamentalYear = @increamentalYear_chart = new Highcharts.Chart({
      chart: {
        renderTo: 'sector_increamental',
        type: 'bar',
        color: '#fff'
        height: 250, marginLeft:65, marginRight: 30
      },
      title: { text: 'Differential Costs (INR Billion) in the year ' },
      subtitle: { text: ""},
      yAxis: { 
        labels: formatter: ->
          return Math.round(this.value/1)      
        title: null 

      },

      xAxis: {
        categories: ['Fossil Fuels',
                     'Bioenergy',
                     'Electricity',
                     'Buildings',
                     'Transport', 'Industry', 'Others', 'Total' ],
        labels: 
          style:{
            color:'#000'
            textDecoration:'underline',
            fontWeight:'bold',
            cursor:'pointer'
          },
          x:-2,
          events: {
            click: ->
              window.twentyfifty.views.costsYear.SecYear = this.label.text
              $.ajax
                url: window.location.pathname.split("/").slice(0, 3).join("/") + "/data"
                dataType: "json"
                async: false
                success: (data) ->

                  data_y = []
                  data_t = []
                  data_year = [2015,2020,2025,2030,2035,2040,2045,2050]
                  data = data.increamental_year[window.twentyfifty.views.costsYear.SecYear]
                  j = 0
                  while j < data.length
                   data_y.push([data_year[j], (Math.round(data[j]*100)/100)])
                   j++

                  if window.yearwise.series[1]?
                    window.yearwise.series[1].setData(data_y,false)
                  else
                    window.yearwise.addSeries({type: 'line', name: window.twentyfifty.views.costsYear.SecYear,data:data_y, Color: '#999999'},false)
                  window.yearwise.setTitle({text: 'Comparision of <span style="color:#2f7ed8">'+ window.twentyfifty.views.costsYear.SecYear + '</span> and <span style="color:#FF9206">Total</span>'})
                  window.yearwise.redraw()

                  return

          }

          formatter: ->
            @value

      },

      legend: {
        enabled: false
      },

      tooltip: { 
        enabled: true
        #crosshairs: true
        #shared: true
        style:
          fontSize: "9px"
          padding: "8px"
          color: "#000"
	
        useHTML: true,
        headerFormat: '{point.key}' + '' + '<table>',
        pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' + '<td style="text-align: right">{point.y:.1f}</td></tr>',
        footerFormat: '</table>'
      },

      plotOptions: {
        bar: {
          dataLabels: {
            enabled: true,
            color: '#000',
            formatter: () ->
              Highcharts.numberFormat(this.y,1)
          }
        }
      }  

      series: []

    })     

    window.yearwise = @yearwise_chart = new Highcharts.Chart({
      chart: {
        renderTo: 'yearwise',
        type: 'line',
        color: '#fff',
        height: 250
      },
      title: { 
        useHTML: true,
        text: '<span style="color:#FF9206">Total</span>',
        align:'center'
        style: {
          fontSize: '20px',
          fontFamily: 'georgia',
          color: '#000'
        }
      },

      subTitle : {text: 'Yearwise Cost Analysis' }

      xAxis: {
        labels: formatter: ->

          switch @value
            when 2015
              return 2015
            when 2025
              return 2025
            when 2035
              return 2035
            when 2045
              return 2045

      },

      yAxis: {
        title: {
          text:'Differential Cost (INR Billion)',
          style: {
            fontSize: '10px',
            color: '#414141',
            fontWeight: 600
          }
          y: -40
        }
      }

      legend: {
        enabled: false
      },

      plotOptions: {
        line: {
          dataLabels: {
            enabled: true,
            color: '#000'
          }
        }
      } 

      tooltip: { 
        enabled: false
        #crosshairs: true
        shared: true
        style:
          fontSize: "9px"
          padding: "8px"
        positioner: ->
          x: 5
          y: 30
	
        useHTML: true,
        headerFormat: '{point.key} <table>',
        pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' + '<td style="text-align: right">{point.y:.1f}</td></tr>',
        footerFormat: '</table>'
      }

      series: []

    })  

    $('#year_range').on 'change', ->

      window.twentyfifty.views.costsYear.curYear = @value
      $.ajax
        url: window.location.pathname.split("/").slice(0, 3).join("/") + "/data"
        dataType: "json"
        async: false
        success: (data) ->
          data_in=[] 
          i=0
          while i < 8
            data_in.push([data['increamental_table'][window.twentyfifty.views.costsYear.curYear][i][0], data['increamental_table'][window.twentyfifty.views.costsYear.curYear][i][1]])  
            i++
          window.increamentalYear.series[0].setData(data_in,false)    
          window.increamentalYear.redraw()
          return
      return

window.twentyfifty.views['costsYear'] = new costsYear
