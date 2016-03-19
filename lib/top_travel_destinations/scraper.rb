class TopTravelDestinations::Scraper

  def self.scrape_regions_array
    index_url = "https://www.tripadvisor.com/TravelersChoice-Destinations"
    html = open(index_url)
    doc = Nokogiri::HTML(html)

    regions_array = []

    doc.search("#tcRegions .tocContainer a").collect do |regionnode|
      name = regionnode.text
      sub_url = regionnode.attribute("href").value
      regions_array << {
        :name => name,
        :region_url => "https://www.tripadvisor.com#{sub_url}"
      }
    end #end iterator
    regions_array
  end #end method

end #end Class