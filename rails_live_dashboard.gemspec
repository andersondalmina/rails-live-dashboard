require_relative 'lib/rails_live_dashboard/version'

Gem::Specification.new do |spec|
  spec.name        = 'rails_live_dashboard'
  spec.version     = RailsLiveDashboard::VERSION
  spec.authors     = ['Anderson Dalmina']
  spec.email       = ['andersondalmina@gmail.com']
  spec.homepage    = 'https://github.com/andersondalmina/rails-live-dashboard'
  spec.summary     = 'Realtime debug dashboard for Rails applications'
  spec.description = 'Realtime debug dashboard for Rails applications'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/andersondalmina/rails-live-dashboard'
  spec.metadata['changelog_uri'] = 'https://github.com/andersondalmina/rails-live-dashboard/blob/main/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.required_ruby_version = '>= 2.7'

  spec.add_dependency 'cssbundling-rails'
  spec.add_dependency 'jsbundling-rails'
  spec.add_dependency 'lucide-rails', '~> 0.2.0'
  spec.add_dependency 'propshaft'
  spec.add_dependency 'puma'
  spec.add_dependency 'rails', '>= 7.1.3'
  spec.add_dependency 'stimulus-rails'
  spec.add_dependency 'turbo-rails'
  spec.add_dependency 'view_component'

  spec.add_development_dependency 'sqlite3'
end
