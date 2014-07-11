module Gempeace
  class Config

    class ConfigInsufficientError < Exception; end

    attr_reader :aws_access_key
    attr_reader :aws_secret_key
    attr_reader :s3_bucket

    def initialize(options)
      @config_file_path = options['config-file'] || "~/.gempeace"

      @aws_access_key = options['aws-access-key'] || ENV['AWS_ACCESS_KEY_ID']
      @aws_secret_key = options['aws-secret-key'] || ENV['AWS_SECRET_ACCESS_KEY']
      @s3_bucket = options['s3-bucket'] || ENV['S3_BUCKET']

      unless @aws_access_key && @aws_secret_key && @s3_bucket
        raise ConfigInsufficientError unless File.exists?(@config_file_path)
        @config_from_file = YAML.load_file(@config_file_path)
        @aws_access_key ||= @config_from_file['aws_access_key']
        @aws_secret_key ||= @config_from_file['aws_secret_key']
        @s3_bucket      ||= @config_from_file['s3_bucket']
      end
    end

  end
end
