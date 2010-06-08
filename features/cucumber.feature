Feature: Setup
  As a dev wanting to verify the Scout API
  You should be able to initialize auth details in the background

  Background:
    Given we load our Scout account info from the config file

  Scenario: Installing the gem
    When a scenario runs
    Then the Scout API is responsive

  Scenario: Less than
    Given I load the sample server's metrics
    Then 'cpu_last_minute' should be less than 1
  
  Scenario: Equal
    Given I load the sample server's metrics
    Then 'disk_size' should be 22
  
  Scenario: Greater than
    Given I load the sample server's metrics
    Then 'cpu_last_minute' should be greater than 0.001
  
  Scenario: Not equal
    Given I load the sample server's metrics
    Then 'cpu_last_minute' should not equal 100