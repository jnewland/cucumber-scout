require 'yaml'
Given 'we load our Scout account info from the config file' do
  config = YAML.load_file(File.join(Dir.pwd, 'config', 'scout.yml'))
  Given "our Scout account name is '"+config['account']+"'"
  Given "our Scout email and password are '"+config['email']+"' and '"+config['password']+"'"
  Given 'I load the sample server\'s metrics'
end

When /^a scenario runs$/ do
  # noop
end

Given 'I load the sample server\'s metrics' do
  config = YAML.load_file(File.join(Dir.pwd, 'config', 'scout.yml'))
  Given "I get the metrics from the '"+config['plugin']+"' plugin on '"+config['hostname']+"'"
end

Then /^the Scout API is responsive$/ do
  Then "'cpu_last_minute' should be less than 1"
end
