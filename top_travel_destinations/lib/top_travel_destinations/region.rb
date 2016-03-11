class TopTravelDestinations::Region

  attr_accessor :name, :region_url

  #I want this to have all the instances of Region to send to CLI.list_regions
  @@all = [] 

  def initialize(region_hash)
    #this takes the hash and passes it to #create_attributes_from_hash, to use send= and create key-value pairs
      #for the name
      #for the url
    self.create_attributes_from_hash(region_hash)
    #pushes instance of Region into @@all
    self.class.all << self
  end

  def self.create_from_array(region_array)
    region_array.each do |region_hash|
      TopTravelDestinations::Region.new(region_hash)
    end
  end

  def create_attributes_from_hash(region_hash)
    #iterates over hash and uses send= to set key-value pairs for instance of Region
    region_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

  def self.all
    @@all
  end

end