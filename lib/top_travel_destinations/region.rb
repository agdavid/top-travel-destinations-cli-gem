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

    doc.css("div#WINNERVIEWER").children.each do |destination|
      name = destination.search("div.mainName a").text
      description = destination.search("div.descr_lb").text      
      
      if name != "" && description !=""
        destinations_array << {
          :name => name,
          :description => description}
      end
    end #end iterator
    destinations_array
  end #end method

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

  def destination_descriptions
    destinations_descriptions_array = []
    self.destinations.each do |destination|
      destinations_descriptions_array << destination.description 
    end
    destinations_descriptions_array
  end

end