require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  let(:page) { pages :one }

  it "gets index" do
    get pages_url
    value(response).must_be :success?
  end

  it "creates page" do
    expect {
      post pages_url, params: { page: { url: 'http://www.example.com' } }
      # post pages_url, params: { page: { url: page.url } }
    }.must_change "Page.count"

    value(response.status).must_equal 201
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
