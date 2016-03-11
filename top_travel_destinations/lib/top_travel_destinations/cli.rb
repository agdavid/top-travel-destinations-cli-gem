class TopTravelDestinations::CLI
  BASE_URL = "http://www.tripadvisor.com/TravelersChoice-Destinations"

  def call
    #list the 9 regions on http://www.fodors.com/world/
    make_regions
    add_destinations_to_regions
    list_regions
    select_region
  end

  def make_regions
    #This creates the array of region hashes from the Scraper Class
    region_array = TopTravelDestinations::Scraper.scrape_regions_array(BASE_URL)
    #This creates new region instances from the Region Class
    TopTravelDestinations::Region.create_from_array(region_array)
  end

  def add_destinations_to_regions
    #This method should scrape the region_url for the top 25 destinations and return a hash
    #This method should use the hash as an argument and add the top 25 attribute via the Region class
  end

  def list_regions
    puts "Regions of the World"
    counter = 1
    TopTravelDestinations::Region.all.each do |region|
      puts "#{counter}. #{region.name} #{region.region_url}"
      counter += 1
    end
    #puts <<-DOC.gsub /^\s+/, ""
     # 1. Africa
      #2. Asia
      #3. Central America
      #4. Europe
      #5. Middle East
      #6. North America
      #7. South America
      #8. South Pacific
    #DOC
  end

  def select_region
    
    input = nil
    while input != "exit"
      puts "Enter the number of the region for which you would like the Top 25 Destinations."
      puts "Enter 'list' to see the regions again, or type 'exit'."
      input = gets.strip.downcase
      case input 
        when "1"
          #this should call another method that provides all the scraped destinations of a region
          #for now, stubbed out to make sure CLI works
          puts "Goes to Africa..."
        when "2"
          puts "Goes to Asia..."
        when "3"
          puts "Goes to Central America..."
        when "4"
          puts "Goes to Europe..."
        when "5"
          puts "Goes to Middle East..."
        when "6"
          puts "Goes to North America..."
        when "7"
          puts "Goes to South America..."
        when "8"
          puts "Goes to South Pacific..."
        when "list"
          list_regions
        when "exit"
          goodbye
        else
          puts "Not sure where you wanted to travel. Type 'list' or 'exit'."
      end #end case
    end #end while loop
  end #end method

  def goodbye
    puts "The World is your oyster. Safe travels!"
  end

end