class TopTravelDestinations::Region

  attr_accessor :name, :region_url

  @@all = [] #I want this to have all the instances of Region to send to CLI.list_regions

  def initialize(region_hash)
    #this takes the hash and passes it to #create_attributes_from_hash, to use send= and create key-value pairs
      #for the name
      #for the url
    #pushes instance of Region into @@all
    
  end

  def self.create_from_array(region_array)
    #takes in the array of regions made by the #regionscraper
    #iterates over the array
    #to each hash, the code block initializes a new region with the hash as the argument 
  end

  def self.create_attributes_from_hash(region_hash)
    #iterates over hash and uses send= to set key-value pairs for instance of Region
  end

end