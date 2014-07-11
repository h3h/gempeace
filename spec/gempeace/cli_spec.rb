require 'spec_helper'

describe Gempeace::CLI do

  describe "#push" do
    let(:gem_name) { "gemname-1.0.0.gem" }
    let(:indexer) { double('Indexer').as_null_object }
    let(:store) { double('Store').as_null_object }

    before do
      subject.store = store
      subject.indexer = indexer
    end

    it "puts the gem file into the store" do
      store.should_receive(:put).with(gem_name)
      subject.push(gem_name)
    end

    it "rebuilds the gem index" do
      indexer.should_receive(:index!)
      subject.push(gem_name)
    end
  end

end
