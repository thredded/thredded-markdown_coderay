# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thredded/markdown_coderay/version'

Gem::Specification.new do |s|
  s.name          = 'thredded-markdown_coderay'
  s.version       = Thredded::MarkdownCoderay::VERSION
  s.authors       = ['Gleb Mazovetskiy']
  s.email         = ['glex.spb@gmail.com']

  s.summary       = 'Thredded Markdown code blocks highlighting via Coderay.'
  s.description   = 'A Thredded plugin that highlights code syntax in your' \
    ' Markdown posts via Coderay.'
  s.homepage      = 'https://github.com/thredded/thredded-markdown_coderay'
  s.license       = 'MIT'

  s.required_ruby_version = '>= 2.5'

  s.files = Dir['{lib}/**/*'] + %w[LICENSE.txt README.md]

  s.require_paths = ['lib']

  s.add_dependency 'coderay'
  s.add_dependency 'kramdown-syntax-coderay'

  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'rubocop', '~> 1.22.1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'thredded', '>= 0.8.0'
end
