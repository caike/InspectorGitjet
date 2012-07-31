# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'inspector_gitjet/version'

Gem::Specification.new do |s|
  s.name        = 'inspector_gitjet'
  s.version     = InspectorGitjet::VERSION
  s.authors     = ['Caike Souza']
  s.email       = ['carloshrsouza@gmail.com']
  s.homepage    = 'https://github.com/caike/InspectorGitjet'
  s.summary     = %q{Insert a summary}
  s.description = %q{Insert a summary}

  s.rubyforge_project = "inspector_gitjet"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency 'grit'
end
