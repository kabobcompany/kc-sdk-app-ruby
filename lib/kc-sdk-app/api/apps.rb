module KcSdkApp
  class Api
    class Apps < Base
      def current
        resp = resource['v1/apps/current'].get
        JSON.parse(resp.body)
      end
    end
  end
end
