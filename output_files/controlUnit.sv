module controlUnit(input logic Clk, reset, levelEasyDone, levelMedDone, start,
						output logic [2:0] screen,
						output logic levelEasyStart, levelMedStart);
						

	enum logic [4:0] {mainMenu, levelEasy, levelMed, endScreen}   curr_state, next_state; 

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (reset)
            curr_state <= mainMenu;
        else 
            curr_state <= next_state;
    end
	 
	 always_comb
    begin
    
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            mainMenu :  if(start)
								next_state = levelEasy;
				
            levelEasy :    if(levelEasyDone)
								next_state = levelMed;	
								 else if(reset)
									next_state = mainMenu;
									
				levelMed : if(levelMedDone)
									next_state = endScreen;
									else if(reset)
									next_state = mainMenu;
								
					
				endScreen : if(reset)
								next_state = mainMenu;
				
							  
        endcase
		  
		  
		  case (curr_state) 
		  mainMenu: 
	         begin
                screen = 3'b000;
					 levelEasyStart = 1'b0;
					 levelMedStart = 1'b0;
				end
   	   levelEasy: 
		      begin
                screen = 3'b001;
					 levelEasyStart = 1'b1;
					 levelMedStart = 1'b0;
		      end
			levelMed: 
		      begin
                screen = 3'b010;
					 levelMedStart = 1'b1;
					 levelEasyStart = 1'b0;
		      end
			endScreen: 
		      begin
					screen = 3'b111;
					levelEasyStart = 1'b0;
					levelMedStart = 1'b0;
				end
                
        endcase
    end

endmodule