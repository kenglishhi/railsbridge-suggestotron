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

  it "renders a list of topics" do
    render
    puts rendered
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Topic Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
