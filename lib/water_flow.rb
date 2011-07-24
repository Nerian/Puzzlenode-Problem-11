class WaterFlow 
  
  attr_accessor :water, :cave
  
  def initialize(options)
    @water = options[:water]
    @cave = parse_cave_string(options[:cave])
  end                   
                 
         
  def show_cave
    @cave.each do |line|
      line.each do |node|
        print node
      end
    end
  end
  
  private 
    
  def parse_cave_string(cave_string)
    @cave = []    
    line = 0
    cave_string.each_char do |c|
      if c == "\n" 
         line +=1
      else
        if @cave[line].nil? then @cave[line] = [] end
        @cave[line] << c
      end             
    end                                         
    @cave
  end     
end