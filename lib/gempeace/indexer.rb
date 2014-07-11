module Gempeace

  class Indexer

    def initialize(config)
      @config = config
    end

    def index!
      puts "Indexing!"
      tmp_dir = Dir.mktmpdir("gempeace")
      # sync index down from S3
      `s3cmd sync s3://#{config.s3_bucket}/ #{tmp_dir}/`
      # run gem generate_index
      `gem generate_index #{tmp_dir}/`
      # sync index back to S3
      `s3cmd sync #{tmp_dir}/ s3://#{config.s3_bucket}/`
    ensure
      FileUtils.remove_entry_secure(tmp_dir)
    end

  end

end
