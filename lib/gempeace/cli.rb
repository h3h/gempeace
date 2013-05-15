require 'aws'
require 'thor'
require 'gempeace'

module Gempeace
  class CLI < Thor

    option 'aws-access-key', aliases: [:key]
    option 'aws-secret-key', aliases: [:secret]
    option 's3-bucket', aliases: :b

    desc "push GEM_FILE", "push the specified GEM_FILE to S3 and rebuild the index"
    def push(gem_file)
STDERR.puts "options: #{options.inspect}"
      # put the file into the S3 bucket
      s3.buckets
      puts "Pushing #{gem_file} to S3 bucket '#{config.s3_bucket}'..."
      # rebuild the gem index
      puts "Rebuilding the gem index..."
    end

    desc "rebuild", "rebuild the gem index and push it to S3"
    def rebuild

    end

    private

    def config
      @config ||= Config.new(options)
    end

    def s3
      @s3 ||= AWS::S3.new(
        access_key_id: config.aws_access_key,
        secret_access_key: config.aws_secret_key
      )
    end
  end
end
