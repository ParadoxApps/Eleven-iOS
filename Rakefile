# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Eleven'
  # app.icons = ['icon_iphone.png', 'icon_iphone_retina.png']
  app.prerendered_icon = true
  app.fonts = ['fontawesome-webfont.ttf']
  app.interface_orientations = [:portrait]
  app.device_family = [:iphone]
end
task :"build:simulator" => :"schema:build"
