require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  let(:page) { pages :one }
  let(:url) { 'http://www.example.com' }

  before do
    stub_request(:get, url)
      .with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
      .to_return(:status => 200, :body => "<h1>heading 1</h1><h2>heading 2</h2>", :headers => {})
  end

  it "gets index" do
    get pages_url
    value(response).must_be :success?
  end

  it "creates page" do
    expect {
      post pages_url, params: { page: { url: url } }
      # post pages_url, params: { page: { url: page.url } }
    }.must_change "Page.count"

    value(response.status).must_equal 201
    assert_requested(:get, url, times: 1)
  end

  it "shows page" do
    get page_url(page)
    value(response).must_be :success?
  end

  it "updates page" do
    patch page_url(page), params: { page: { url: page.url } }
    value(response.status).must_equal 200
  end

  it "destroys page" do
    expect {
      delete page_url(page)
    }.must_change "Page.count", -1

    value(response.status).must_equal 204
  end
end
