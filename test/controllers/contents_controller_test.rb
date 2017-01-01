require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  let(:content) { contents :one }

  it "gets index" do
    get contents_url
    value(response).must_be :success?
  end

  it "creates content" do
    expect {
      post contents_url, params: { content: { body: content.body, page_id: content.page_id, tag: content.tag } }
    }.must_change "Content.count"

    value(response.status).must_equal 201
  end

  it "shows content" do
    get content_url(content)
    value(response).must_be :success?
  end

  it "updates content" do
    patch content_url(content), params: { content: { body: content.body, page_id: content.page_id, tag: content.tag } }
    value(response.status).must_equal 200
  end

  it "destroys content" do
    expect {
      delete content_url(content)
    }.must_change "Content.count", -1

    value(response.status).must_equal 204
  end
end
