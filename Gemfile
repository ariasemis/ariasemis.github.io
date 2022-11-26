source "https://rubygems.org"

gem "rake"

gem "github-pages", "~> 227", group: :jekyll_plugins

# because Windows does not include zoneinfo files
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.0", :install_if => Gem.win_platform?

# used to validate html output
# NOTE:
# version 5+ requires ruby 3+ 
# -> upgrading ruby causes issues when using jekyll serve
# -> see: https://github.com/github/pages-gem/issues/752
# -> wait until github-pages properly supports it
# version 4+ fails to run validation
# -> see: https://github.com/gjtorikian/html-proofer/issues/781
gem "html-proofer", "~> 3.19.0"

