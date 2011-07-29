class WaterFlow 
  
  attr_accessor :water, :cave, :measures
  
  def initialize(options)
    @water = options[:water]
    @cave = parse_cave_string(options[:cave])
    show_cave
  end
  
  def simulate_flow()    
    @amount_of_water = @water    
    cave = @cave.clone       
    x, y = find_starting_position  
    
    @amount_of_water += -1
    
    go_down(x, y, cave)
    go_right(x, y, cave)    
    
    @measures = calculate_measures(cave)
                                 
    cave            
  end    
  
  def calculate_measures(cave)              
    height = cave[0].length
    width = cave.length   
    measures = ''  
        
    height.times do |x|  
      units_in_current_column = 0 
      width.times do |y| 
        if cave[y][x] == '~' and not units_in_current_column == '~'
          units_in_current_column += 1
          if cave[y+1][x] == ' '
             units_in_current_column = '~'            
          end          
        end        
      end  
      measures += units_in_current_column.to_s + ' '
    end                             
    measures.strip
  end
  
  def go_down(x, y, cave)
    if @amount_of_water > 0
      if cave[y + 1][x] == ' '
        @amount_of_water += -1
        mark_as_water(x, y + 1, cave)
        go_down(x, y + 1, cave) 
      elsif cave[y][x + 1] == ' '
        go_right(x, y, cave)        
      end             
      go_right(x, y, cave)
    end
  end  
  
  def go_right(x, y, cave)  
    if @amount_of_water > 0
      if cave[y][x + 1] == ' '
        @amount_of_water += -1
        mark_as_water(x + 1, y, cave)
        go_down(x + 1, y, cave)
      elsif cave[y + 1][x] == ' ' 
        go_down(x, y, cave)
      end
    end    
  end            
  
  def mark_as_water(x, y, cave)
    cave[y][x] = '~'           
    if ENV['slow_motion']
      system('clear')                
      print show_cave          
      sleep(1.0/24.0)                
    end    
  end
    
  def show_cave(cave = @cave)
    output = ''
    cave.each do |line|
      line.each do |node|
        output += node
      end
      output += "\n"
    end            
    output
  end
   
  def find_starting_position    
    x, y = 0,0
    @cave.each_index do |line|
      col = @cave[line].index('~')
      if not col.nil? 
        x, y = col, line
        break
      end
    end
    [x, y]
  end 
    
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