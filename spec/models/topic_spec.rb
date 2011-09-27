require 'spec_helper'

describe Topic do
  context "validation" do
    it { should validate_presence_of(:title)}
  end
  context "associations" do
    it { should have_many(:votes)}
  end
end
