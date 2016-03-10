class TopTravelDestinations::CLI

  def call
    #list the 9 regions on http://www.fodors.com/world/
    list_regions
    select_region
    goodbye
  end

  def list_regions
    #this should call another method that provides all the scraped regions
    #for now, stubbed out to make sure CLI works
    puts "Regions of the World"
    puts <<-DOC.gsub /^\s+/, ""
      1. USA
      2. Europe
      3. Asia
      4. Caribbean
      5. Australia & The Pacific
      6. Africa & The Middle East
      7. Mexico & Central America
      8. Canada
      9. South America
    DOC
  end

  def select_region
    
    input = nil
    while input != "exit"
      puts "Enter the number of the region you would like more information about, type list to see the regions again, or type exit."
      input = gets.strip.downcase
      case input 
        when "1"
          #this should call another method that provides all the scraped destinations of a region
          #for now, stubbed out to make sure CLI works
          puts "Goes to top 10 of USA..."
        when "2"
          puts "Goes to top 10 of Europe..."
        when "3"
          puts "Goes to top 10 of Asia..."
        when "4"
          puts "Goes to top 10 of Caribbean..."
        when "5"
          puts "Goes to top 10 of Australia & The Pacific..."
        when "6"
          puts "Goes to top 10 of Africa & The Middle East..."
        when "7"
          puts "Goes to top 10 of Mexico & Central America..."
        when "8"
          puts "Goes to top 10 of Canada..."
        when "9"
          puts "Goes to top 10 of South America..."
        when "list"
          list_regions
        else
          puts "Not sure where you wanted to travel. Type 'list' or 'exit'."
      end #end case
    end #end while loop
  end #end method

  def goodbye
    puts "The World is your oyster. Safe travels!"
  end

end