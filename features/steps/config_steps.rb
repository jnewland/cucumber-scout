require 'yaml'
Given 'we load our Scout account info from the config file' do
  config = YAML.load_file(File.join(Dir.pwd, 'config', 'scout.yml'))
  Given "our Scout account name is '"+config['account']+"'"
  Given "our Scout email and password are '"+config['email']+"' and '"+config['password']+"'"
  Given "I get the metrics from the 'Server Overview' plugin on the test server"
end

When /^a scenario runs$/ do
  # noop
end

Given /^I get the metrics from the '([^\"]*)' plugin on the test server$/ do |plugin|
  config = YAML.load_file(File.join(Dir.pwd, 'config', 'scout.yml'))
  Given "I get the metrics from the '"+plugin+"' plugin on '"+config['hostname']+"'"
end

Then /^the Scout API is responsive$/ do
  Then "'cpu_last_minute' should be less than 100"
end
