class TopTravelDestinations::Region

  attr_accessor :name, :region_url, :destinations 

  @@all = [] 

  def initialize(region_hash)
    self.create_attributes_from_hash(region_hash)
    self.class.all << self
  end

  def self.create_from_array(region_array)
    region_array.each do |region_hash|
      TopTravelDestinations::Region.new(region_hash)
    end
  end

  def create_attributes_from_hash(region_hash)
    region_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

  def create_attribute_from_array(destinations_array)
    self.destinations = destinations_array
  end

  def self.all
    @@all
  end

end