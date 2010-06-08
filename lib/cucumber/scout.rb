require 'scout_scout'

module Cucumber
  module Scout

    def self.scout_account=(name)
      ScoutScout.account = name
    end

    def self.scout_auth(email, password)
      ScoutScout.basic_auth email, password
    end

    class << self
      attr_accessor :scout_hostname, :scout_plugin_name
    end

  protected

    def self.value_for_hostname_plugin_and_descriptor(hostname=nil,plugin=nil,descriptor=nil)
      hostname ||= self.scout_hostname
      plugin ||= self.scout_plugin_name
      ScoutScout::Server.first(hostname).plugins.find { |p| p.name.downcase == plugin.downcase }.descriptors.find { |d| d.name.downcase == descriptor.downcase }.value
    end

  end
end

World(Cucumber::Scout)
require 'cucumber/nagios/steps'