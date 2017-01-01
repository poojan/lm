require 'test_helper'
require 'external_sites'

describe ExternalSites do
  let(:url) { 'http://www.example1.com' }

  before do
    stub_request(:get, url)
      .with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
      .to_return(:status => 200, :body => "<h1>heading 1</h1><h2>heading 2</h2><a href='https://www.google.com'>Google</a>", :headers => {})
  end

  it "should extract tags" do
    tags_data = ExternalSites.extract_tags_data(url)
    assert_equal tags_data.length, 3, "No of tags do not match."
    assert_requested(:get, url, times: 1)
  end

end
