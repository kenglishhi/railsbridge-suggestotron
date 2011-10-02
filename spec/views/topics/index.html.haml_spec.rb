require 'spec_helper'

describe "topics/index.html.haml" do
  before(:each) do
    assign(:topics, [
        stub_model(Topic,
                   :title => "Topic Title",
                   :description => "MyText"
        ),
        stub_model(Topic,
                   :title => "Topic Title",
                   :description => "MyText"
        )
    ])
  end

  context "when not logged in" do
    before do
      @view.stub(:current_user).and_return(nil)
    end

    it "renders a list of topics" do
      render
      puts rendered
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "div.topic > h4", :text => "Topic Title".to_s, :count => 2
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "div.topic > p", :text => "MyText".to_s, :count => 2
    end
    it "should not show a '+1' link" do
      render
      rendered.should_not have_selector("a",
                                        :text => "+1")
    end
  end
  context "when logged in" do
    before do
      @user = users(:first_user)
      @view.stub(:current_user).and_return(@user)
    end

    it "should show a '+1' link" do
      render
      rendered.should have_selector("a",
                                    :text => "+1")
    end
    context "should not allow them to voted twice" do
      before(:each) do
        assign(:topics, [
            stub_model(Topic,
                       :title => "Topic Title",
                       :description => "MyText",
                       :votes => [Vote.new(:user =>@user)]
            )
        ])
      end
      it "should not show +1 if they have already voted " do
        render
        rendered.should_not have_selector("a",
                                          :text => "+1")
      end
    end
  end

end