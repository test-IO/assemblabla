module Assembla
  class Milestone < Assembla::Base
  	has_many :tickets
  end
end