require 'spec_helper'

describe Task do

  describe "#search" do
    before do
      Task.create! name: 'Ir por algo de leche'
      Task.create! name: 'Ir por algo de cheve'
      Task.create! name: 'Ir por nenas'
    end

    specify do
      results = Task.search 'algo'
      results.count.should == 2
    end
  end
end
