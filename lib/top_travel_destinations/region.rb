class TopTravelDestinations::Region

  attr_accessor :name, :region_url, :destinations 

  @@all = [] 

  def initialize(region_hash)
    self.create_attributes_from_hash(region_hash)
    self.destinations = []
    self.get_destinations
    self.class.all << self
  end

  def self.create_from_array(regions_array)
    regions_array.each do |region_hash|
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

  def self.get_regions
    TopTravelDestinations::Scraper.scrape_regions_array
  end

  def get_destinations
    destinations_array = self.scrape_destinations_array
    self.add_destinations(destinations_array)
  end

  def scrape_destinations_array
    html = open(self.region_url)
    doc = Nokogiri::HTML(html)

    destinations_array = []
    
    doc.search("div.winnerName div.mainName a").collect do |destination|
      name = destination.text
      #description = ... code to come
      destinations_array << {
        :name => name
        #:description = description
      }
    end#end iterator
    destinations_array
  end#end iterator

  #creates "has many" relationship to instance of Region
  def add_destinations(destinations_array)
    destinations_array.each do |destination_hash|
      destination = TopTravelDestinations::Destination.new(destination_hash) 
      self.destinations << destination
      destination.region = self
    end
  end

  def destination_names
    destinations_names_array = [] 
    self.destinations.each do |destination|
      destinations_names_array << destination.name
    end
    destinations_names_array 
  end

end