Gem::Specification.new do |s|
  s.name        = "dictionary_lookup"
  s.version     = "0.2.0"
  s.platform    = Gem::Platform::RUBY
  s.date        = "2015-04-05"
  s.summary     = "A ruby gem that wraps pearson dictionary API"
  s.author      = "Nitish Parkar"
  s.email       = "developer.nitish@gmail.com"
  s.files       = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.homepage    = "https://github.com/nitishparkar/dictionary-lookup-rb"
  s.license     = "MIT"

  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency "rake", "~> 10"
  s.add_development_dependency "minitest", "~> 5.0"
end
