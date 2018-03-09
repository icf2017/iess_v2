#!/usr/bin/env rake
# coding: utf-8
require 'sprockets'
require 'rake/sprocketstask'
require 'app/model/load_model'
require 'app/helpers/helper'

# This deals with the javascript and css
Rake::SprocketsTask.new do |t|
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path 'app/assets/vendors'

  environment.context_class.class_eval do 
    include Helper
  end

  t.environment = environment
  t.output      = "./public/assets"
  t.assets      = %w( application.js application.css )
end



require 'haml'
require 'json'
require_relative 'app/helpers/helper'

manifest = './public/assets/manifest.json'
file manifest => ['assets']  

desc "Compiles changes to src/default.html.haml into public/default.html and adds links it to the latest versions of application.cs and application.js"
task 'html' => [manifest] do 

  class Context
    include Helper
  end

  context = Context.new

  # We need to figure out the filename of the latest javascript and css
  context.assets = JSON.parse(IO.readlines(manifest).join)['assets']

  input = IO.readlines('./src/default.html.haml').join
  File.open('./public/default.html','w') do |f|
    f.puts Haml::Engine.new(input).render(context)
  end
end


