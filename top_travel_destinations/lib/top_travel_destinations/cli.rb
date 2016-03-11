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
    #This method should scrape the region_url for the top 25 destinations and return an array
    #This method should use the array as an argument and add the top 25 attribute via the Region class
    TopTravelDestinations::Region.all.each do |region|
      destinations_array = TopTravelDestinations::Scraper.scrape_destinations_array(region.region_url)
      region.create_attribute_from_array(destinations_array)
    end
  end

  def list_regions
    puts "Regions of the World"
    TopTravelDestinations::Region.all.each_with_index do |region, index|
      puts "#{index+1}. #{region.name}"
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
      puts "Enter the number of the region for which you would like the Top Destinations."
      puts "Enter 'list' to see the regions again, or type 'exit'."
      input = gets.strip.downcase 
      #case 
        if (1..TopTravelDestinations::Region.all.count).to_a.include?(input.to_i)
          index_value = input.to_i-1
          show_top_destinations(index_value)
        #when "1"
          #index_value = input.to_i-1
          #show_top_destinations(index_value)
          #puts "Goes to Africa...
        #when "2"
          #index_value = input.to_i-1
          #show_top_destinations(index_value)
          #puts "Goes to Asia..."
        #when "3"
          #index_value = input.to_i-1
          #show_top_destinations(index_value)
          #puts "Goes to Central America..."
        #when "4"
          #index_value = input.to_i-1
          #show_top_destinations(index_value)
          #puts "Goes to Europe..."
        #when "5"
          #index_value = input.to_i-1
          #show_top_destinations(index_value)
          #puts "Goes to Middle East..."
        #when "6"
          #index_value = input.to_i-1
          #show_top_destinations(index_value)
          #puts "Goes to North America..."
        #when "7"
          #index_value = input.to_i-1
          #show_top_destinations(index_value)
          #puts "Goes to South America..."
        #when "8"
          #index_value = input.to_i-1
          #show_top_destinations(index_value)
          #puts "Goes to South Pacific..."
        elsif input == "list"
          list_regions
        elsif input == "exit"
          goodbye
        else
          puts "Please input a valid command."
        end #end case
    end #end while loop
  end #end method

  def show_top_destinations(index_value)
    puts "The Top Destinations For the #{TopTravelDestinations::Region.all[index_value].name} are:"
    counter = 1
    TopTravelDestinations::Region.all[index_value].destinations.each do |destination|
      puts "#{counter}. #{destination}"
      counter +=1
    end
  end

  def goodbye
    puts "The World is your oyster. Safe travels!"
  end

end