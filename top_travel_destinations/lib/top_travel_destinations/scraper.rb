class TopTravelDestinations::Scraper

  #1. Need a scraper to get the Top 9 Regions and return an array of hashes to send to Region Class
  def self.scrape_regions_array(index_url)
    # a. method takes index_url(http://www.fodors.com/world/) as argument
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
  


end