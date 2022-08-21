require 'rest-client'
require 'kc-sdk-app/version'
require 'kc-sdk-app/configuration'
require 'kc-sdk-app/api'

require 'kc-sdk-app/engine' if defined?(::Rails)

module KcSdkApp
  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.api
    @api ||= Api.new
  end
end
