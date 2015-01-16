# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require './lib/motion-imager'

begin
  require 'bundler'
  require 'motion/project/template/gem/gem_tasks'
  require 'ProMotion'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-imager'

  app.pods do
    pod 'JTSImageViewController', '~> 1.4'
  end
end
