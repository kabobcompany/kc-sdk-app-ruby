RSpec.describe KcSdkApp::Api::Apps do
  describe '#current' do
    let(:url) { 'https://cloud.kabob.io/api/app/v1/apps/current' }
    let(:req) { { headers: { Authorization: "Bearer #{access_token}" }, method: :get, url: url } }
    let(:resp) { OpenStruct.new(body: '{}') }

    before do
      KcSdkApp.configuration.access_token = '1234';
    end

    context 'when access_token from configuration' do
      let(:access_token) { KcSdkApp.configuration.access_token }

      after do
        KcSdkApp::Api.new.apps.current
      end

      it { expect(RestClient::Request).to receive(:execute).once.with(hash_including(req)).and_return(resp) }
    end

    context 'when access_token attribute changed' do
      let(:access_token) { 'abcd' }

      after do
        api = KcSdkApp::Api.new(access_token: access_token)
        api.apps.current
      end

      it { expect(RestClient::Request).to receive(:execute).once.with(hash_including(req)).and_return(resp) }
    end
  end
end
