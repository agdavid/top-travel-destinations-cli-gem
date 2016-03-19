class TopTravelDestinations::Destination

  #creates "belongs to" relationship to instance of Region
  attr_accessor :name, :region

  @@all = []

  def initialize(destination_hash)
    self.create_attributes_from_hash(destination_hash)
    self.class.all << self
  end

  def create_attributes_from_hash(destination_hash)
    destination_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

  def self.all
    @@all
  end

end