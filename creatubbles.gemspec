$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'creatubbles/version'

spec = Gem::Specification.new do |s|
  s.name = 'creatubbles'
  s.version = Creatubbles::VERSION
  s.required_ruby_version = '>= 2.2.3'
  s.summary = 'Ruby bindings for Creatubbles API'
  s.description = 'Creatubbles is the safe global community for creators of all ages'
  s.author = 'Creatubbles'
  s.email = 'support@creatubbles.com'
  s.homepage = 'https://gitub.com/creatubbles/ctb-api-ruby'
  s.license = 'MIT'

  s.add_dependency('oauth2', '>= 1.3.0')

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
