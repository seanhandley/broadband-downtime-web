class Probe < ActiveRecord::Base
  attr_accessible :successful, :from_ip, :probed_at
  
  validates :from_ip, :probed_at, :presence => true
end