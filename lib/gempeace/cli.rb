require 'aws'
require 'thor'
require 'gempeace'

module Gempeace
  class CLI < Thor

    attr_accessor :config
    attr_accessor :indexer
    attr_accessor :store

    option 'aws-access-key', aliases: [:key]
    option 'aws-secret-key', aliases: [:secret]
    option 's3-bucket', aliases: :b

    def initialize(*args)
      super
      @config   = Config.new(options)
      @indexer  = Indexer.new(config)
      @store    = Store.new(config)

    rescue Config::ConfigInsufficientError => ex
      STDERR.puts "You need to configure gempeace with ~/.gempeace, CLI options or ENV variables."
      exit -1
    end

    desc "push GEM_FILE", "push the specified GEM_FILE to S3 and rebuild the index"
    def push(gem_file)
      # put the file into the S3 bucket
      @store.put(gem_file)
      # rebuild the gem index
      puts "Rebuilding the gem index..."
      @indexer.index!
    end

    desc "rebuild", "rebuild the gem index and push it to S3"
    def rebuild
      @indexer.index!
    end
  end
end
