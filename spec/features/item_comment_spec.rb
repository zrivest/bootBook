require 'spec_helper'

describe "Comment integration test" do
  let(:content) { "Fake Status Update"}
  let(:user) { User.create!(FactoryGirl.attributes_for(:user))}
  let(:data) {{ user: user, content: content}}
  let(:comment) { "fake comment" }

  it "should display an error if no content is provided" do
    post_status(data)
    post_comment(nil)
    page.should have_text("Content can't be blank")
  end

  it "should post the comment to the page" do
    post_status(data)
    post_comment(comment)
    page.should have_text(data[:content])
  end

  it "should only post an error once under the content" do
    post_status(data)
    post_another_status(content)
    post_comment(nil)
  end
end
