RSpec.describe KcSdkApp do
  describe '#configuration' do
    subject { KcSdkApp.configuration }
    it { expect(subject).not_to eq(nil) }
  end

  describe '#api' do
    subject { KcSdkApp.api }
    it { expect(subject).not_to eq(nil) }
  end
end
