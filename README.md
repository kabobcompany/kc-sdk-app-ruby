[![Build Status](https://ci.kabob.io/api/badges/kabobcompany/kc-sdk-app-ruby/status.svg)](https://ci.kabob.io/kabobcompany/kc-sdk-app-ruby)
# kc-sdk-app
Provides kabob cloud app api client.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kc-sdk-app'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kc-sdk-app

For rails, create config `config/initializers/kc_sdk_app.rb`

```ruby
KcSdkApp.configure do |config|
  # kabob cloud api url, default: https://cloud.kabob.io
  config.api_url = 'https://cloud.kabob.io'

  # you have to set your app access token
  config.access_token = 'YOUR_APP_ACCESS_TOKEN'

  # you can set a logger if you want logging api request
  # config.logger = Rails.logger
end
```

## Usage

[Api](#api)

### Api
#### Orders
##### surplus
Get surplus
```ruby
result = KcSdkApp.api.orders.surplus(company_id: 1, plan: 'go', scope: 'point')
# { "data": 10, is_trial: false }
```

```ruby
result = KcSdkApp.api.orders.surplus(company_id: 1, plan: 'go', scope: 'license')
# { "data": 10, is_trial: false, active_until: '2030-01-01 00:00:00' }
```

##### consuming
Consume order balance
```ruby
result = KcSdkApp.api.orders.consuming(company_id: 1, plan: 'go', scope: 'point', quantity: 1, taken_at: '2020-12-25 00:00:00 UTC', uid: 'uid')
# { "meta": { "code": 0 } }
```

## Contact
The project's website is located at https://github.com/kabobcompany/kc-sdk-app-ruby
