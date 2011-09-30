require 'spec_helper'

describe Topic do
  context "validation" do
    it { should validate_presence_of(:title)}
  end
  context "associations" do
    it { should have_many(:votes)}
  end
  describe "number_of_votes" do
    before do
      @topic = Topic.create(:title => "New Topic")
    end
    it "should have 0 vote" do
      @topic.number_of_votes.should == 0
    end
    it "should have 1 vote" do
      @topic.votes << Vote.new
      @topic.number_of_votes.should == 1
    end
    it "should have 2 vote" do
      @topic.votes << Vote.new
      @topic.votes << Vote.new
      @topic.number_of_votes.should == 2
    end
  end
end
