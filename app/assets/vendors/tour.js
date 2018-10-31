$(window).load(function () {

  var tour = new Tour({
    onEnd: function () {
      $('.popover').css('display', 'none')
    }
  });

  tour.addSteps([
    {
      orphan: true,
      placement: "top",
      backdrop: true,
      title: "Welcome to Karnataka State Energy Calculator 2050",
      content: "The KSEC, 2050 is an energy scenario building tool, which aims to explore a range of potential future energy scenarios for India, for diverse energy demand and supply sectors, leading up to 2050.<br/> <br/> 17 Energy Demand and Supply sectors, and 38 levers that will impact our energy system are available to the user. Combination of the above choices offer hundreds of energy pathways till the year 2050.",
    },
    {
      element: "ul.navbar-nav",
      placement: "bottom",
      backdrop: true,
      title: "The Implications",
      content: "This menu bar gives you a range of options (we call the implications for a pathway) that you can explore for your chosen pathway.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "ul.help",
      placement: "top",
      backdrop: true,
      title: "Need some help?",
      content: "Click on ‘Help’ to know more about how to use the webtool and some more of its interesting features.<br/> You can also submit feedback & explore the technical white papers",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "ul.share",
      placement: "top",
      backdrop: true,
      title: "Share with friends",
      content: "You can share the pathway that you have created on your social media accounts by clicking on the Facebook and Twitter icons.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#classic_controls",
      placement: "top",
      backdrop: true,
      title: "The choices",
      content: "Select the level of effort for Demand sectors, Supply options to meet the Demand and levels of effort for Network and Systems",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#7",
      placement: "top",
      backdrop: true,
      title: "Pick your choice for each sector",
      content: "Select the scenario (we call them Levels) by clicking on the boxes.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#dd-7",
      placement: "top",
      backdrop: true,
      title: "Sub-sector options",
      content: "Click on the downward arrow to look at more sub-sector options within a broad sector.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#info-7",
      placement: "top",
      backdrop: true,
      title: "What does each lever say?",
      content: "Click on the information icon to open a snapshot of the sector trajectories.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#guide",
      placement: "left",
      backdrop: true,
      title: "Key",
      content: "For more information on what the symbols mean, you can have a look at the glossary.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#results",
      placement: "bottom",
      backdrop: true,
      title: "Graphs and Charts",
      content: "As you pick your sector choices, these graphs will dynamically reflect your choices.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#display_table",
      placement: "right",
      backdrop: true,
      title: "More chart display options",
      content: "Explore more graphs and charts of your chosen levels by clicking on these items.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#warning",
      placement: "left",
      backdrop: true,
      title: "Implication specific alerts/ messages",
      content: "These boxes would inform you for information specific to the implications chosen by you.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#curTab",
      placement: "bottom",
      backdrop: true,
      title: "Current Pathway",
      content: "This text dynamically changes to reflect your chosen implication and chosen pathway.",
      backdropPadding: 10,
      animation: true
    },
    {
      element: "#pathway_box",
      placement: "top",
      backdrop: true,
      title: "Choose an example scenario",
      content: "Choose from several pre-programmed example pathways to witness their implications.",
      backdropPadding: 10,
      animation: true
    }
  ]);

  // Initialize the tour
  tour.init();

  // Start the tour
  tour.start(true);
  tour.showStep(0);


  $("#TourLink").click(function () {
    //tour.restart(true);
    tour.restart(true);
    tour.showStep(0);
  });

});
