class TopTravelDestinations::Region

  attr_accessor :name, :region_url, :destinations 

  @@all = [] 

  def initialize(region_hash)
    self.create_attributes_from_hash(region_hash)
    self.destinations = []
    self.get_destinations
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

  def get_destinations
    html = open(self.region_url)
    doc = Nokogiri::HTML(html)
    
    doc.search("div.winnerName div.mainName a").collect do |destination|
      name = destination.text
      self.destinations << name
    end#end iterator
  end

  def self.get_regions
    TopTravelDestinations::Scraper.scrape_regions_array
  end

end