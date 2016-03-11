class TopTravelDestinations::Scraper

  #1. Need a scraper to get the Top 9 Regions and return an array of hashes to send to Region Class
  def self.scrape_regions_array(index_url)
    # a. method takes BASE_URL(http://www.tripadvisor.com/TravelersChoice-Destinations) as argument
    # b. uses open-uri to get HTML
    html = open(index_url)
    # c. uses Nokogiri to get NodeNest
    doc = Nokogiri::HTML(html)
    # e. uses Nokogiri .css method to get element/classes with desired regions
        #i. This gets the regions doc.css("#tcRegions .tocContainer a").text
        #ii. This gets the sub_url doc.css("#tcRegions .tocContainer a").attribute("href").value
    # f. iterates to obtain text of regions
    region_array = []

    doc.search("#tcRegions .tocContainer a").each do |regionnode|
      name = regionnode.text
      sub_url = regionnode.attribute("href").value
      region_array << {
        :name => name,
        :region_url => "http://www.tripadvisor.com#{sub_url}"
      }
    end
    # g. returns array of hashes
    region_array
  end

  #2. Need a scraper to get the Top 10 Destinations of each Region as an array of arrays then send to Region Class and add as key-value pair
  def self.scrape_destinations_array(profile_url)
    # a. method takes region_url from each Region instance as argument
    # b. uses open-uri to get HTML
    html = open(profile_url)
    # c. uses Nokogiri to get NodeNest
    doc = Nokogiri::HTML(html)

    destinations_array = []

    doc.search("div.winnerName div.mainName a").each do |destination|
      name = destination.text
      destinations_array << name
    end
    destinations_array
  end


end