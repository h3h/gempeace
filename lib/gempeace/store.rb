module Gempeace
  class Store

    class InvalidGemFileError < Exception; end
    class LocalFileNotFoundError < Exception; end

    def initialize(config)
      @config = config
      @s3 = AWS::S3.new(
        access_key_id:      @config.aws_access_key,
        secret_access_key:  @config.aws_secret_key
      )
    end

    def put(gem_file)
      puts "Pushing #{gem_file} to S3 bucket '#{@config.s3_bucket}'..."
      f = Pathname.new(gem_file)
      raise LocalFileNotFoundError unless f.exist?
      raise InvalidGemFileError unless f.extname == ".gem"

      obj = @s3.buckets[@config.s3_bucket].objects["gems/#{gem_file}"]
      obj.write(f)
    end
  end
end
