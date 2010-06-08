require 'rubygems'
require 'rake'
$LOAD_PATH.unshift 'lib'
require 'cucumber/scout/version'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.version = Cucumber::Scout::VERSION
    gem.name = "cucumber-scout"
    gem.summary = %Q{Cucumber steps for verifing metrics from Scout's API}
    gem.description = %Q{Cucumber steps for verifing metrics from Scout's API}
    gem.email = "jnewland@gmail.com"
    gem.homepage = "http://github.com/jnewland/cucumber-scout"
    gem.authors = ["Jesse Newland"]
    gem.add_dependency "scout_scout", "~> 0.0.4"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = Cucumber::Scout::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "cucumber-scout #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
