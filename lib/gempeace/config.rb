module Gempeace
  class Config

    attr_reader :aws_access_key
    attr_reader :aws_secret_key
    attr_reader :s3_bucket

    def initialize(options)
      STDERR.puts "in Config, options: #{options.inspect}"
      @s3_bucket = options['s3-bucket'] || ENV['S3_BUCKET']
    end

  end
end
