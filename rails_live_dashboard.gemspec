require_relative 'lib/rails_live_dashboard/version'

Gem::Specification.new do |spec|
  spec.name        = 'rails_live_dashboard'
  spec.version     = RailsLiveDashboard::VERSION
  spec.authors     = ['Anderson Dalmina']
  spec.email       = ['andersondalmina@gmail.com']
  spec.homepage    = 'https://github.com/andersondalmina/rails-live-dashboard'
  spec.summary     = 'Realtime dashboard for Rails applications'
  spec.description = 'Realtime dashboard for Rails applications'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/andersondalmina/rails-live-dashboard'
  spec.metadata['changelog_uri'] = 'https://github.com/andersondalmina/rails-live-dashboard/blob/main/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.1.3'
end
