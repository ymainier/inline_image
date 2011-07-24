# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "inline_image/version"

Gem::Specification.new do |s|
  s.name        = "inline_image"
  s.version     = InlineImage::VERSION
  s.authors     = ["Yann Mainier"]
  s.email       = ["yann.mainier@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Inline images within css and html files using data URI}
  s.description = %q{Inline image parses css and html files to replace small file by a data URI reprentation in base64.}

  s.rubyforge_project = "inline_image"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('thor')

  s.add_development_dependency('rspec')

end
