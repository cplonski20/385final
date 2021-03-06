module controlUnit(input logic Clk, reset, levelEasyDone, levelMedDone, start, input logic [2:0] guessesEasy, guessesMedium,
						output logic [2:0] screen,
						output logic levelEasyStart, levelMedStart);
						

	enum logic [4:0] {mainMenu, levelEasy, levelMed, endScreen, pauseEM}   curr_state, next_state; 

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (reset)
            curr_state <= mainMenu;
//		  if(guessesEasy >2 || guessesMedium > 2)
//				curr_state <=endScreen;
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
								next_state = pauseEM;	
								 else if(reset)
									next_state = mainMenu;
								 else if(guessesEasy > 2)
									next_state = endScreen;
				pauseEM:		
								next_state = levelMed;
									
				levelMed : if(levelMedDone)
									next_state = endScreen;
									else if(reset)
									next_state = mainMenu;
									else if(guessesMedium > 2)
									next_state = endScreen;
								
					
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
			pauseEM:
				begin
                screen = 3'b010;
					 levelEasyStart = 1'b1;
					 levelMedStart = 1'b0;	
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