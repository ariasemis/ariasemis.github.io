source "https://rubygems.org"

# gem "jekyll", "~> 3.8.7"

# to upgrade, run `bundle update github-pages`
gem "github-pages", "~> 206", group: :jekyll_plugins

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.6"
end

# because Windows does not include zoneinfo files
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.0", :install_if => Gem.win_platform?

