require "test_helper"

describe Page do
  let(:page) { Page.new }

  let(:url) { 'http://www.example.com' }

  before do
    stub_request(:get, url)
      .with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
      .to_return(:status => 200, :body => "<h1>heading 1</h1><h2>heading 2</h2>", :headers => {})
  end

  it "should not allow empty urls" do
    body = {
      url: nil
    }
    tags_data = []
    saved_page_id = page.save_page_and_content(body, tags_data)
    assert_not saved_page_id
  end

  it "should save page and tag contents" do
    body = {
      url: url
    }
    tags_data = [
      { tag: 'h1', body: 'Heading 1' },
      { tag: 'h2', body: 'Heading 2' },
    ]
    saved_page_id = page.save_page_and_content(body, tags_data)
    assert saved_page_id

    found = Page.find(saved_page_id)
    assert found
    assert_equal found.contents.length, 2
    assert_equal found.url, url
  end
end
