require 'sinatra/base'
require 'sprockets'
require 'bootstrap'
require 'sass'
require 'coffee-script'
require 'execjs'

require_relative 'app/controllers/serve_model_data'
require_relative 'app/controllers/redirect_old_versions'
require_relative 'app/controllers/serve_html'
require_relative 'app/helpers/helper'

class Application < Sinatra::Base

  configure do
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
  end

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :staging do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    enable :logging, :dump_errors, :raise_errors
    set :raise_errors, true #false will show nicer error page
    set :show_exceptions, true #true will ignore raise_errors and display backtrace in browser
  end

  set :public_folder, File.dirname(__FILE__) + '/public/'
  set :environment, Sprockets::Environment.new

  # append assets paths
  environment.append_path "app/assets/stylesheets"
  environment.append_path "node_modules/"
  environment.append_path "app/assets/vendors"
  environment.append_path "app/assets/javascripts"

  environment.context_class.class_eval do
    include Helper
  end

  # get assets
  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  use Rack::Deflater
  use ServeModelData
  use ServeHTML

end