require 'test_helper'
require 'generators/rails_live_dashboard/install_generator'

module RailsLiveDashboard
  class InstallGeneratorTest < Rails::Generators::TestCase
    tests InstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    test 'generator runs without errors' do
      assert_nothing_raised do
        run_generator ['install']
      end
    end
  end
end
