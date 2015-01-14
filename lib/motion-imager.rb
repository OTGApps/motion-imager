# encoding: utf-8

require 'motion-cocoapods'

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

lib_dir_path = File.dirname(File.expand_path(__FILE__))
Motion::Project::App.setup do |app|
  app.files.unshift(Dir.glob(File.join(lib_dir_path, "motion-imager/**/*.rb")))

  app.pods do
    pod 'JTSImageViewController', '~> 1.4'
  end
end
