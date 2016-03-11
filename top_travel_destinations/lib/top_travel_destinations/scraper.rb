class TopTravelDestinations::Scraper

  #1. Need a scraper to get the Top 9 Regions and return an array of hashes to send to Region Class
  def self.scrape_regions_array(index_url)
    # a. method takes index_url(http://www.fodors.com/world/) as argument
    # b. uses open-uri to get HTML
    # c. uses Nokogiri to get NodeNest
    # e. uses Nokogiri .css method to get element/classes with desired regions
    # f. iterates to obtain text of regions
    # g. returns array of hashes
  end



#2. Need a scraper to get the Top 10 Destinations of each Region as an array of arrays then send to Region Class and add as key-value pair

end