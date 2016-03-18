class TopTravelDestinations::Scraper

  def self.scrape_regions_array
    index_url = "https://www.tripadvisor.com/TravelersChoice-Destinations"
    html = open(index_url)
    doc = Nokogiri::HTML(html)

    region_array = []

    doc.search("#tcRegions .tocContainer a").collect do |regionnode|
      name = regionnode.text
      sub_url = regionnode.attribute("href").value
      region_array << {
        :name => name,
        :region_url => "https://www.tripadvisor.com#{sub_url}"
      }
    end #end iterator
    region_array
  end #end method

end #end Class