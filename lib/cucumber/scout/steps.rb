require 'cucumber/scout'

Given /^(my|our) Scout account name is '([^\"]*)'$/ do |junk, name|
  Cucumber::Scout.scout_account = name
end

Given /^(my|our) Scout email and password are '([^\"]*)' and '([^\"]*)'$/ do |junk, email, password|
  Cucumber::Scout.scout_auth email, password
end

Given /^I get the metrics from the '([^\"]*)' plugin on '([^\"]*)'$/ do |plugin, hostname|
  Cucumber::Scout.scout_hostname = hostname
  Cucumber::Scout.scout_plugin_name = plugin
end

Then /^(the |)'([^\"]*)' should (be|be less than|be greater than|equal|not equal|not be) ([\d\.]+)( milliseconds| percent|)$/ do |predicate, metric, operator, intended_value, unit|
  real_value = Cucumber::Scout.value_for_hostname_plugin_and_descriptor(Cucumber::Scout.scout_hostname, Cucumber::Scout.scout_plugin_name, metric).to_f
  intended_value = intended_value.to_f
  case operator
  when 'be less than'
    real_value.should < intended_value
  when 'be greater than'
    real_value.should > intended_value
  when 'be', 'equal'
    real_value.should == intended_value
  when 'not be', 'not equal'
    real_value.should_not == intended_value
  end
end