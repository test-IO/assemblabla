module Assembla
  class Ticket < Assembla::Base

  	def url
  		"https://www.assembla.com/spaces/#{self.space_id}/tickets/cardwall#/ticket:#{self.number}"
  	end
  end
end