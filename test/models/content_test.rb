require "test_helper"

describe Content do
  let(:content) { Content.new }

  it "must be valid" do
    value(content).must_be :valid?
  end
end
