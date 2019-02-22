require 'test_helper'

describe Webmention, '.send' do
  let(:source_url) { 'https://source.example.com' }
  let(:target_url) { 'https://target.example.com' }
  let(:target_endpoint_url) { "#{target_url}/webmention" }

  describe 'when no endpoint found' do
    before do
      stub_request(:any, target_url).to_return(
        body: TestFixtures::SAMPLE_POST_HTML
      )
    end

    it 'returns nil' do
      Webmention.send(source_url, target_url).must_be_nil
    end
  end

  describe 'when endpoint found' do
    before do
      stub_request(:any, target_url).to_return(
        headers: {
          Link: %(<#{target_endpoint_url}>; rel="webmention")
        }
      )

      stub_request(:post, target_endpoint_url).to_return(
        status: 200
      )
    end

    it 'returns an HTTP::Response' do
      Webmention.send(source_url, target_url).must_be_instance_of(HTTP::Response)
    end
  end
end
