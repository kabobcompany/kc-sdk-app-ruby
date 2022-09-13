require 'kc-sdk-app/api/base'
require 'kc-sdk-app/api/orders'
require 'kc-sdk-app/api/apps'

module KcSdkApp
  class Api
    attr_accessor :access_token
    attr_accessor :orders
    attr_accessor :apps

    def initialize(access_token: KcSdkApp.configuration.access_token)
      self.access_token = access_token
      self.orders = KcSdkApp::Api::Orders.new(self)
      self.apps = KcSdkApp::Api::Apps.new(self)
    end

    def resource
      @resource ||= RestClient::Resource.new(
        "#{KcSdkApp.configuration.api_url}/api/app",
        log: KcSdkApp.configuration.logger,
        headers: { 'Authorization': "Bearer #{self.access_token}" }
      )
    end
  end
end
