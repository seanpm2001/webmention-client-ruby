lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webmention/version'

Gem::Specification.new do |s|
  s.name          = 'webmention'
  s.version       = Webmention::VERSION
  s.date          = '2014-05-25'
  s.homepage      = 'https://github.com/indieweb/mention-client-ruby'
  s.summary       = 'A gem for sending webmention (and pingback) notifications'
  s.authors       = [
    'Aaron Parecki',
    'Nat Welch'
  ]

  s.email         = 'aaron@parecki.com'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'json'
  s.add_dependency 'nokogiri'
  s.add_dependency 'httparty', '~> 0.13.1'
  s.add_dependency 'link_header', '~> 0.0.8'

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'webmock'
end
