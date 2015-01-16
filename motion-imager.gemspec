# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-imager/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "motion-imager"
  spec.version       = MotionImager::VERSION
  spec.authors       = ["Mark Rickert"]
  spec.email         = ["mjar81@gmail.com"]
  spec.description   = "An interactive iOS image viewer that does it all: double tap to zoom, flick to dismiss, et cetera."
  spec.summary       = "A RubyMotion DSL for JTSImageViewController, a \"light box\" for iOS. It's similar to image viewers you may have seen in apps like Twitter, Tweetbot, and others. It presents an image in a full-screen interactive view. Users can pan and zoom, and use Tweetbot-style dynamic gestures to dismiss it with a fun flick."
  spec.homepage      = "https://github.com/OTGApps/motion-imager"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "motion-cocoapods", ">= 1.4.1"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'ProMotion'
end
