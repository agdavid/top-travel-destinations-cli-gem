class TopTravelDestinations::Destination

  #each instance of Destination "belongs to" an instance of Region
  attr_accessor :region

end