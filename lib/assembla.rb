require 'resources/base'
require 'resources/space'

module Assembla
  class Client
    attr_accessor :key, :secret
    
    def initialize(key, secret)
      self.key    = key
      self.secret = secret
    end

    def spaces
      Class.new(Assembla::Space) do |c|
        def self.name; superclass.name; end
        c.site = "http://www.wwwwwwwwwwwww.de/?k=#{key}&s=#{secret}"
      end
    end

  end
end





#@client = Assembla::Client.new(key, secret)
#
#@client.spaces
#
#@client.tickets
