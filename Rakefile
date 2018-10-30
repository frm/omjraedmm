require "rake"
require "sinatra"

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/app")

require "boot"

if %i[development test].include? Sinatra::Base.environment
  namespace :lint do
    require "rubocop/rake_task"
    RuboCop::RakeTask.new(:ruby)
  end
end

desc "Run all linters"
task lint: %i[lint:ruby]

task default: :lint
