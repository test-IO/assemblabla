require 'active_resource'
require 'assemblabla/base'
require 'assemblabla/space'
require 'assemblabla/ticket'
require 'assemblabla/custom_fields'
require 'assemblabla/milestone'
require 'assemblabla/user'
require 'assemblabla/ticket_component'

module Assembla
  class Client
    attr_accessor :key, :secret

    BASE_URL = 'https://api.assembla.com/v1/'

    def initialize(key, secret)
      self.key    = key
      self.secret = secret
    end

    def resource(name, options={})
      the_key    = self.key
      the_secret = self.secret
      klass      = "Assembla::#{name.to_s.classify}".constantize
      Class.new(klass) do |c|
        def self.name; superclass.name; end
        c.element_name            = name.to_s
        c.site                    = "#{BASE_URL}#{options[:prefix]}"
        c.headers['Content-type'] = 'application/json'
        c.headers['X-Api-Key']    = the_key
        c.headers['X-Api-Secret'] = the_secret
      end
    end

    def spaces
      resource(:space)
    end

    def tickets(space_id)
      resource(:ticket, prefix: "spaces/#{space_id}/")
    end

    def milestones(space_id)
      resource(:milestone, prefix: "spaces/#{space_id}/")
    end

    def users(space_id)
      resource(:user, prefix: "spaces/#{space_id}/")
    end

    def ticket_components(space_id)
      resource(:ticket_component, prefix: "spaces/#{space_id}/")
    end
  end
end
