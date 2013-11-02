require 'spec_helper'

describe "Status integration test" do
  let(:content) { "Fake Status Update"}
  let(:user) { User.create!(FactoryGirl.attributes_for(:user))}
  let(:data) {{ user: user, content: content}}

  it "should display an error if no content is provided" do
    data[:content] = nil
    post_status(data)
    page.should have_text("Content can't be blank")
  end

  it "should post the status to the page" do
    post_status(data)
    page.should have_text(data[:content])
  end
end
