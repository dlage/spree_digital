require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

RSpec::Core::RakeTask.new

task :default => [:spec]

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_digital'

  require File.join `bundle show spree_core`.chomp, 'lib/generators/spree/dummy/dummy_generator.rb'
  Spree::DummyGenerator.class_eval do
    def test_dummy_add_digital
      # pulled from: http://jumph4x.net/post/20067515804/testing-spree-1-0-x-extensions-w-other-extension
      puts "Installing #{ENV['LIB_NAME']} migrations [required for testing]"
      directory File.join(`bundle show #{ENV['LIB_NAME']}`.chomp, 'db', 'migrate'), File.join(dummy_path, 'db')
    end
  end

  Rake::Task['extension:test_app'].invoke
end
