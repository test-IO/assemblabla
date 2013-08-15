module Assembla
  class Ticket < Assembla::Base


  	def self.by_milestone(space_id, milestone_id)
  		self.find(:all, :from => "spaces/#{space_id}/tickets/milestone/#{milestone_id}")
  	end
  end
end