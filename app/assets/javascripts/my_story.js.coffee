
MystoryHTML = "
  <div id='Mystory'>
    <p></p>
    <div>
      <div id='story_T_demand'>
        <h4>Transport Demand</h5>
        <span></span>
      </div> 
      <div id='story_I_demand'>
        <h4>Industry Demand</h4>
        <span></span>
      </div> 
      <div id='story_B_demand'>
        <h4>Buildings</h4>
        <span></span>
      </div>
      <div id='story_C_demand'>
        <h4>Cooking</h4>
        <span></span>
      </div>
      <div id='story_A_demand'>
        <h4>Agriculture</h4>
        <span></span>
      </div>
    </div>
    <div>
      <table id='story_supply'>
      </table> 
      <div class='StoryDivder'></div>
      <div id='story_R_supply'>
        <h4>Renewable and Clean Energy</h4>
        <span></span>
      </div> 
      <div id='story_T_supply'>
        <h4>Thermal Generation</h4>
        <span></span>
      </div> 
      <div id='story_B_supply'>
        <h4>Bioenergy</h4>
        <span></span>
      </div>
    </div>
    <div>
      <div id='story_over'>
        <h4>Over generation and Balancing requirement</h4>
        <span></span>
      </div> 
    </div> 
  </div>
"

class MyStory

  constructor: () ->

  setup: () ->
    return false if @ready
    @ready = true
    $('#story_T_demand').empty()
    document.getElementById("results").style.width = "98%"
    document.getElementById("print_div").style.width = "1%"
    document.getElementById("print_div").style.float = "right"
    $('#results').append(MystoryHTML)

    document.getElementById("pathway_box").style.display = "block"
    document.getElementById("classic_controls").style.display = "block"
    document.getElementById("display_table").style.display = "none"
    document.getElementById("print_div").style.display = "block"
    document.getElementById("warning").style.display = "none"

    $('#print_div').append("<a href='javascript:void(0);' OnClick='CallPrint();' style='float:left;'><img src='../../assets/images/print.png' width='20' title='Print' alt='Print' /></a>")
  teardown: () ->
    $('#results').empty()
    $('#print_div').empty()
    $('#Mystory').empty()
    @ready = false

  updateNavBar: () ->
    $('li.nav-item a.active').removeClass('active')
    $('li.nav-item:nth-child(7) a').addClass('active')

  updateResults: (@pathway) ->
    @updateNavBar()
    @setup() unless @ready
    $('#Mystory p').html(@pathway['my_story'][0][0])

    $('#story_T_demand span').empty()
    $('#story_T_demand span').append(
      @pathway['my_story'][3][0] + ' ' + (@pathway['my_story'][3][1]).toFixed(0) + ' ' +
        @pathway['my_story'][4][0] + ' ' + ((@pathway['my_story'][4][1]).toFixed(2)*100) + '% ' +
        @pathway['my_story'][5][0] + ' ' + ((@pathway['my_story'][5][1]).toFixed(2)*100) + '% ' +
        @pathway['my_story'][6][0] + ' ' + ((@pathway['my_story'][6][1]).toFixed(2)*100) + '% ' +
        @pathway['my_story'][7][0] + ' ' + ((@pathway['my_story'][7][1])*100).toFixed(0) + '% ' +
        @pathway['my_story'][8][0] + ' ' + + ((@pathway['my_story'][8][1])*100).toFixed(0) + '% ' +
        @pathway['my_story'][9][0] + '<br><br>' +
        @pathway['my_story'][11][0] + ' ' + ((@pathway['my_story'][11][1]).toFixed(0)) + ' ' +
        @pathway['my_story'][12][0] + ' ' + ((@pathway['my_story'][12][1]).toFixed(2)*100) + '% ' +
        @pathway['my_story'][13][0] + ' ' + ((@pathway['my_story'][13][1]).toFixed(2)*100) + '% ' +
        @pathway['my_story'][14][0] + ' ' + ((@pathway['my_story'][14][1]).toFixed(2)*100) + '% ' +
        @pathway['my_story'][15][0] + ' ' + ((@pathway['my_story'][15][1]).toFixed(2)*100) + '% '
        @pathway['my_story'][16][0] + ' '
    )

  
    $('#story_I_demand span').empty()
    $('#story_I_demand span').append(
      @pathway['my_story'][19][0] + ' ' + @pathway['my_story'][19][1].toFixed(0) + ' ' +
      @pathway['my_story'][20][0] + ' ' + @pathway['my_story'][20][1].toFixed(0) + ' ' +
      @pathway['my_story'][21][0]
    )
  
    $('#story_B_demand span').empty()
    $('#story_B_demand span').append(
      @pathway['my_story'][24][0] + ' ' + (@pathway['my_story'][24][1])*100 + '% ' +
      @pathway['my_story'][25][0] + ' ' + @pathway['my_story'][25][1].toFixed(2)*100 + '%' +
      @pathway['my_story'][26][0] + ' ' + @pathway['my_story'][26][1].toFixed(2) + ' ' +
      @pathway['my_story'][27][0]
    )
  
    $('#story_C_demand span').empty()
    $('#story_C_demand span').append(
      @pathway['my_story'][30][0] + ' ' + (@pathway['my_story'][30][1]).toFixed(2) + ' ' +
      @pathway['my_story'][31][0] + ' ' + ((@pathway['my_story'][31][1]).toFixed(4)*100) + '% ' +
      @pathway['my_story'][32][0] + ' ' + ((@pathway['my_story'][32][1]).toFixed(4)*100) + '% ' +
      @pathway['my_story'][33][0] + ' ' + ((@pathway['my_story'][33][1]*100).toFixed(2)) + '% ' +
      @pathway['my_story'][34][0] + ' ' + ((@pathway['my_story'][34][1]*100).toFixed(2)) + '% ' +
      @pathway['my_story'][35][0]
    )

    $('#story_A_demand span').empty()
    $('#story_A_demand span').append(
      @pathway['my_story'][38][0] + ' ' + ((@pathway['my_story'][38][1]).toFixed(2)*100) + '% ' +
      @pathway['my_story'][39][0] + ' ' + ((@pathway['my_story'][39][1]).toFixed(2)*100) + '% ' +
      @pathway['my_story'][40][0] + ' ' + ((@pathway['my_story'][40][1]).toFixed(2)*100) + '% ' +
      @pathway['my_story'][41][0] + ' ' + ((@pathway['my_story'][41][1]).toFixed(2)*100) + '% ' +
      @pathway['my_story'][42][0])
  
    $('#story_supply').empty()
    $('#story_supply').append('<tr><th>'+@pathway['my_story'][53][0]+ '</th></tr>');

    j = 55
    while j < 71
      $('#story_supply').append('<tr><td>'+@pathway['my_story'][j][0]+'</td><td>'+(@pathway['my_story'][j][1]).toFixed(0)+'</td><td>'+(@pathway['my_story'][j][2]).toFixed(0)+'</td></tr>');
      j++
  
    $('#story_R_supply span').empty()
    $('#story_R_supply span').append(
      @pathway['my_story'][76][0] + ' ' + ((@pathway['my_story'][76][1]*100).toFixed(2)) + '% ' +
      @pathway['my_story'][77][0] + ' ' + (@pathway['my_story'][77][1]).toFixed(0) + ' ' +
      @pathway['my_story'][78][0] + ' ' + (@pathway['my_story'][78][1]).toFixed(0) + ' ' +
      @pathway['my_story'][79][0] + ' ' + (@pathway['my_story'][79][1]).toFixed(0) + ' ' +
      @pathway['my_story'][80][0] + ' ' + (@pathway['my_story'][80][1]).toFixed(0) + ' ' +
      @pathway['my_story'][81][0] + ' ' + (@pathway['my_story'][81][1]).toFixed(0) + ' ' +
      @pathway['my_story'][82][0]
    )
  
    $('#story_T_supply span').empty()
    $('#story_T_supply span').append(
      @pathway['my_story'][86][0] + ' ' + (@pathway['my_story'][86][1]).toFixed(0) + ' ' +
      @pathway['my_story'][87][0] + ' ' + (@pathway['my_story'][87][1]).toFixed(0) + ' ' +
      @pathway['my_story'][88][0] + ' ' + (@pathway['my_story'][88][1]).toFixed(0) + ' ' +
      @pathway['my_story'][89][0] + ' ' + (@pathway['my_story'][89][1]).toFixed(0) + ' ' +
      @pathway['my_story'][90][0] + ' ' + (@pathway['my_story'][90][1]).toFixed(0) + ' ' +
      @pathway['my_story'][91][0]
    )
  
    $('#story_B_supply span').empty()
    $('#story_B_supply span').append(
      ((@pathway['my_story'][94][1]).toFixed(2)*100) + '% ' +
      @pathway['my_story'][95][0] + ' ' + (@pathway['my_story'][95][1]*100).toFixed(2) + '% ' +
      @pathway['my_story'][96][0] + ' ' + (@pathway['my_story'][96][1]*100).toFixed(0) + '% ' +
      @pathway['my_story'][97][0] + ' ' + @pathway['my_story'][97][1].toFixed(0) + ' ' +
      @pathway['my_story'][98][0] + @pathway['my_story'][98][1] +
      @pathway['my_story'][99][0]
    )
  
    $('#story_over span').empty()
    $('#story_over span').append(
      @pathway['my_story'][101][0] + ' ' + ((@pathway['my_story'][101][1]*100).toFixed(2)) + '% ' +
      @pathway['my_story'][102][0]+ ' ' + (@pathway['my_story'][102][1]).toFixed(0) + ' ' +
      @pathway['my_story'][103][0]
    )


window.twentyfifty.views['my_story'] = new MyStory
