require 'sinatra'
require 'haml'
require_relative '../../app/helpers/helper'

# This has the methods needed to dynamically create the view
class ServeHTML < Sinatra::Base
  if development?

    helpers Helper
    set :views, File.expand_path('../../views', __FILE__)

    get '/' do
      haml :'default.html'
    end

    get %r{/pathways/(\d{59})/(.*)} do |id, action|
      haml :'default.html'
    end

    get '/docs/Karnataka_energy_2050.xlsx' do
      send_file File.join(settings.root, '../models', 'model.xlsx'), :filename => 'Karnataka_energy_2050.xlsx', :type => 'Application/octet-stream'
    end

  else

    get '/' do
      send_file 'public/default.html'
    end

    get %r{/pathways/(\d{59})/(.*)} do |id, action|
      send_file 'public/default.html'
    end

    get '/docs/Karnataka_energy_2050.xlsx' do
      send_file File.join(settings.root, '../models', 'model.xlsx'), :filename => 'Karnataka_energy_2050.xlsx', :type => 'Application/octet-stream'
    end

  end
end