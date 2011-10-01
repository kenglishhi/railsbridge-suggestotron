require 'spec_helper'

describe VotesController do
  context "POST create" do
    before do
      @user = users(:first_user)
      sign_in @user
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
    describe "With valid params and format json" do
      before do
        @topic = topics(:first_topic)
      end
      it "should return number_of_votes" do
        post :create, :format => 'json', :topic_id => @topic.id
        json_response = JSON.parse(response.body)
        json_response['number_of_votes'].should == 2
      end
    end
  end

end
