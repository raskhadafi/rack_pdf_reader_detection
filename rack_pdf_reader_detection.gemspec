# coding: utf-8
lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rack_pdf_reader_detection/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack_pdf_reader_detection'
  spec.version       = RackPdfReaderDetection::VERSION
  spec.authors       = ['Roman Simecek']
  spec.email         = ['roman@good2go.ch']
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = 'http://good2go.ch'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb'] + %w[README.md LICENSE.txt]
  spec.require_paths = ['lib']
  spec.test_files    = Dir['test/**/*.rb']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rack-test'

  spec.add_dependency 'rack'
end
