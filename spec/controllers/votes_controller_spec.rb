require 'spec_helper'

describe VotesController do
  context "POST create" do
    before do
      @topic = Topic.create(:title => 'My First Topic')
    end
    it "should create a vote" do
      expect {
        post :create, :topic_id => @topic.id
      }.to change(Vote, :count).by(1)
    end
    it "should redirect to homepage" do
      post :create, :topic_id => @topic.id
      response.should redirect_to(topics_path)
    end
  end

end
