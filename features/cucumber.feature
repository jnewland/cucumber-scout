Feature: Setup
  As a dev wanting to verify the Scout API
  You should be able to initialize auth details in the background

  Background:
    Given we load our Scout account info from the config file

  Scenario: Installing the gem
    When a scenario runs
    Then the Scout API is responsive

  Scenario: Less than
    When I get the metrics from the 'Server Overview' plugin on the test server
    Then 'cpu_last_minute' should be less than 100
  
  Scenario: Equal
    When I get the metrics from the 'Passenger' plugin on the test server
    Then 'passenger_queue_depth' should be 0
  
  Scenario: Greater than
    When I get the metrics from the 'Server Overview' plugin on the test server
    Then 'cpu_last_minute' should be greater than 0.001
  
  Scenario: Not equal
    When I get the metrics from the 'Server Overview' plugin on the test server
    Then 'cpu_last_minute' should not equal 100