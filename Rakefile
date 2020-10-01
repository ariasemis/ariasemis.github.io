require 'html-proofer'

task :default => :serve

desc 'Clean up site'
task :clean do
    FileUtils.rm_rf('_site')
end

desc 'Build site'
task :build => :clean do
    sh "bundle exec jekyll build"
end

desc 'Preview at localhost'
task :serve do
    sh "bundle exec jekyll serve --watch --incremental --future --drafts"
end

desc 'Validate site'
task :test => :build do
    options = { 
        :assume_extension => true,
        :allow_hash_href => true, # don't break on <a href="#">
        :typhoeus => {
            # avoid SSL errors: https://github.com/gjtorikian/html-proofer/issues/376
            :ssl_verifypeer => false,
            :ssl_verifyhost => 0
        }
    }
    HTMLProofer.check_directory("./_site", options).run
end
