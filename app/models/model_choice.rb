class ModelChoice

  attr_accessor :number, :name, :type, :descriptions, :long_descriptions

  def initialize(number, name, type, descriptions, long_descriptions)
    @number, @name, @type, @descriptions, @long_descriptions = number, name, type, descriptions, long_descriptions
  end

  def incremental_or_alternative
    'incremental'
  end

  def levels
    1.upto(type.to_i)
  end

  NUMBER_TO_DOC_MAP = {
    0 => 'Gas Power Stations',
    1 => 'Coal Power Stations',
    2 => 'Efficiency of Coal Power Stations',
    3 => 'coal_power_stationspdf',
    4 => 'CCS Fuel Mix',
    5 => 'CCS Power Stations',
    6 => 'Nuclear Power Stations',
    7 => 'Large Hydro Power Stations',
    8 => 'Solar Photovoltaic',
    9 => 'Solar Photovoltaic',
    10 => 'Onshore Wind',
    11 => 'Offshore Wind',
    12 => 'Small Hydro Power Stations',
    13 => 'Distribted Solar PV( Solar Rooftop)',
    14 => 'Solar Water Heaters',
    15 => 'Cross border electricity trade import',
    16 => 'Biomass Residue Production',
    17 => 'Biomass Residue Production',
    18 => 'Biomass Residue End Use Application',
    19 => 'First and Second Generation Biofuel Production',
    20 => 'Biofuel Production from Algae',
    21 => 'Energy from Waste',
    22 => 'Hydrogen Production for Transport',
    23 => 'Domestic Gas Production',
    24 => 'Coal Production',
    25 => 'Domestic Oil Production',
    26 => 24, #Not used
    27 => 'Growth of the Economy',
    28 => 'Shift to Public Transport',
    29 => 'Passenger Transport Demand', #No pdf
    30 => 'Passenger Transport Mode', #No pdf
    31 => 'Shift to Public Transport',
    32 => 'Electric and Fuel Cell Vehicles',
    33 => 'Electric and Fuel Cell Vehicles',
    34 => 'Freight Transport Demand',
    35 => 'Freight Transport Mode',
    36 => 'Urban Planning',
    37 => 'Penetration of Energy Efficient Envelope',
    38 => 'Efficiency of Lighting and Appliances',
    39 => 'Building Envelope Optimization',
    40 => 'Efficiency of Commercial lightings and appliances',
    41 => 'Energy Intensity of Industry',
    42 => 'Fuel Switching Choices – Cement',
    43 => 'Fuel Switching Choices – Iron and Steel',
    44 => 'Fuel Shift and Cookstove Efficiency',
    45 => "Choice of fuel for irrigationpdf",
    46 => 'Energy Demand for Pumps and Tractors',
    47 => 'Fuel Split for Pumps',
    48 => 'Telecom_One-pager',
    50 => 'T&D Losses',
    51 => 'Energy and Power Storage',
    52 => 'Reliability of the Grid',
    54 => 'Temperature Stress'
  }

  def doc
    #"#{NUMBER_TO_DOC_MAP[number] || number}.html"
    "#{NUMBER_TO_DOC_MAP[number] || number}.pdf"
  end
end
