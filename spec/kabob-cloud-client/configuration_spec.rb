RSpec.describe KcSdkApp::Configuration do
  describe '#initialize' do
    subject { KcSdkApp::Configuration.new(api_url: 'http://host.com') }
    its(:api_url) { should eq 'http://host.com' }
  end
end
