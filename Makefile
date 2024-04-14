build:
	gem build rails_live_dashboard.gemspec

publish:
	gem push rails_live_dashboard-$(version).gem
