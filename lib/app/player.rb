class Player
  attr_accessor :name, :sign
    def initialize(name_to_save)
      @name = name_to_save
      @sign = ''
  
    end
    
    def display_player
      puts "Name = #{@name}", "Symbol: #{@sign}"
    end
end
  


