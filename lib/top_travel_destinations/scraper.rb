class TopTravelDestinations::Scraper

  def self.scrape_regions_array(index_url)
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

  def self.scrape_destinations_array(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)

    destinations_array = []

    doc.search("div.winnerName div.mainName a").collect do |destination|
      name = destination.text
      destinations_array << name
    end#end iterator
    destinations_array
  end#end method

end #end Class