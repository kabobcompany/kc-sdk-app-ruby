require 'kc-sdk-app/api/base'
require 'kc-sdk-app/api/orders'

module KcSdkApp
  class Api
    attr_accessor :orders

    def initialize
      self.orders = KcSdkApp::Api::Orders.new(self)
    end

    def resource
      @resource ||= RestClient::Resource.new(
        "#{KcSdkApp.configuration.api_url}/api/app",
        log: KcSdkApp.configuration.logger,
        headers: { 'Authorization': "Bearer #{KcSdkApp.configuration.access_token}" }
      )
    end
  end
end
