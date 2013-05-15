module Gempeace

  class Indexer

    def initialize(config)
      @config = config
    end

    def build_index!
      # sync index down from S3
      # run gem generate_index
      # sync index back to S3
    end

  end

end
