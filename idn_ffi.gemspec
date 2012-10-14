# -*- encoding: utf-8 -*-
require File.expand_path('../lib/idn_ffi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Konstantin Makarchev"]
  gem.email         = ["kostya27@gmail.com"]
  gem.description   = %q{LibIdn FFI ruby binding}
  gem.summary       = %q{LibIdn FFI ruby binding}
  gem.homepage      = "https://github.com/kostya/idn_ffi"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "idn_ffi"
  gem.require_paths = ["lib"]
  gem.version       = IDNFFI::VERSION
  
  gem.add_dependency "ffi"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
