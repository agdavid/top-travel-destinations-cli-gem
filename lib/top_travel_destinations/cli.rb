class TopTravelDestinations::CLI
  
  def call
    welcome_screen
    make_regions_and_destinations
    list_regions
    select_region
  end

  def welcome_screen
    puts "\n"
    puts "Welcome to Top Travel Destinations"
    puts "\n"
    puts "          .-'';'-."
    puts "        ,'   <_,-.`."
    puts "       /)   ,--,_>\\_\\ "
    puts "      |'   (      \\_ |"
    puts "      |_    `-.    / |"
    puts "       \\`-.   ;  _(`/"
    puts "        `.(    \\/ ,'"
    puts "          `-....-'"
  end

  def make_regions_and_destinations
    regions_array = TopTravelDestinations::Region.get_regions
    TopTravelDestinations::Region.create_from_array(regions_array)
  end

  def list_regions
    puts "\n"
    puts "Here are the Regions of the World:"
    TopTravelDestinations::Region.all.each_with_index do |region, index|
      puts "#{index+1}. #{region.name}"
    end
  end

  def select_region
    input = nil
    while input != "exit"
      puts "\n"
      puts "Enter the number of the region for which you would like the Top Travel Destinations."
      puts "Enter 'list' to see the regions again OR type 'exit'."
      input = gets.strip.downcase 
      if (1..TopTravelDestinations::Region.all.count).to_a.include?(input.to_i)
        index_value = input.to_i-1
        show_top_destinations(index_value)
      elsif input == "list"
        list_regions
      elsif input == "exit"
        goodbye
      else
        puts "\n"
        puts "Please input a valid command."
      end #end case
    end #end while loop
  end #end method

  def show_top_destinations(index_value)
    region_instance = TopTravelDestinations::Region.all[index_value]
    puts "\n"
    puts "The Top Destinations For the #{region_instance.name} region are:"
    counter = 1
    region_instance.destination_names.each do |destination|
      puts "#{counter}. #{destination}"
      counter +=1
    end
  end

  def goodbye
    puts "\n"
    puts "                       The World is your oyster." 
    puts "               Thanks for using Top Travel Destinations!" 
    puts <<-DOC
 _________________________          _____
|                         \\          \\ * \\__      _____
|   Safe                   \\__________\\   \\/_______\\___\\_____________
|   Travels!               /          < /_/   .....................  `-.
|_________________________/            `-----------,----,--------------'
                                                 _/____/
    
    DOC
  end

end