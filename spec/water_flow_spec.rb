require 'spec_helper'

describe WaterFlow do   
  let(:simple_cave) do
    "################################\n"+
     "~                              #\n"+
     "#         ####                 #\n"+
     "###       ####                ##\n"+
     "###       ####              ####\n"+
     "#######   #######         ######\n"+
     "#######   ###########     ######\n"+
     "################################"
  end 
  
  describe "# Creates a new water_flow parser" do 
    before(:each) { @water_flow = WaterFlow.new(:water => 50, :cave => simple_cave)  }
    
    it "Should have a number of water units" do
      assert { @water_flow.water == 50 }      
    end
    
    it "Should parse the cave file" do    
      assert { @water_flow.cave == 
        [
        	['#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#'],
        	['~',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'],
        	['#',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#','#','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'],
        	['#','#','#',' ',' ',' ',' ',' ',' ',' ','#','#','#','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#'],
        	['#','#','#',' ',' ',' ',' ',' ',' ',' ','#','#','#','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#','#','#'],
        	['#','#','#','#','#','#','#',' ',' ',' ','#','#','#','#','#','#','#',' ',' ',' ',' ',' ',' ',' ',' ',' ','#','#','#','#','#','#'],
        	['#','#','#','#','#','#','#',' ',' ',' ','#','#','#','#','#','#','#','#','#','#','#',' ',' ',' ',' ',' ','#','#','#','#','#','#'],
        	['#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#']
        ]}
      
    end    
  end
end   