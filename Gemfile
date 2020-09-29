source "https://rubygems.org"

# to upgrade, run `bundle update github-pages`
gem "github-pages", "~> 208", group: :jekyll_plugins

# because Windows does not include zoneinfo files
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.0", :install_if => Gem.win_platform?

