module  levelEasy ( input logic        levelEasyStart, Clk, openner, reset,
							input logic [9:0] pickY, pickLRx,
                       output logic levelEasyDone, close, output logic [3:0] HEXOUT, output logic [2:0] guesses);
							  
							  
							  
					
			myRandState coolman(.Clk(Clk), .enable(levelEasyStart), .myStateEasy(correctState), .myStateMedium(0), .myStateHard(0)); //considers max value as '30' and min value as
		
			//assign currLevel = 3'b001;
			logic found;
			logic [2:0] guessesEasy;
			initial guessesEasy = 3'b000;
			
			//logic guesses = 
			
			
			logic [3:0] correctState, closeLower, closeAbove;
			assign HEXOUT = guesses;
			
			assign closeLower = correctState - 1;
			assign closeAbove = correctState + 1;
			
			logic [15:0] guessChecker; 
			initial guessChecker = 16'h0000;
			
			
			//implement random generation as input to this module to generate correct state in future!!!!
			
			enum logic [3:0] {zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen}   curr_state; 
			//assign curr_state = one;

	//updates flip flop, current state is the only one
    
	 
	 always_ff @ (posedge Clk)
	 begin
          if(pickY >= 32 && pickY <= 60)
				 curr_state = zero;
			 else if(pickY >= 61 && pickY <= 88)
				 curr_state = one;
		    else if(pickY >= 89 && pickY <= 116)
				 curr_state = two;
			 else if(pickY >= 117 && pickY <= 144)
				 curr_state = three;
			 else if(pickY >= 145 && pickY <= 172)
				 curr_state = four;
			 else if(pickY >= 173 && pickY <= 200)
				 curr_state = five;
		    else if(pickY >= 201 && pickY <= 228)
				 curr_state = six;
			 else if(pickY >= 229 && pickY <= 256)
				 curr_state = seven;
			 else if(pickY >= 257 && pickY <= 284)
				 curr_state = eight;
			 else if(pickY >= 285 && pickY <= 312)
				 curr_state = nine;
			 else if(pickY >= 313 && pickY <= 340)
				 curr_state = ten;
			 else if(pickY >= 341 && pickY <= 368)
				 curr_state = eleven; 
			 else if(pickY >= 369 && pickY <= 396)
				 curr_state = twelve;
			 else if(pickY >= 397 && pickY <= 424)
				 curr_state = thirteen;
			 else if(pickY >= 425 && pickY <= 452)
				 curr_state = fourteen;
			 else if(pickY >= 452 && pickY <= 479)
				 curr_state = fifteen;
end
		 
always_comb
		 begin
		 
		 levelEasyDone = ((curr_state == correctState) & ~openner & (pickLRx <= 500));
		 close = ((curr_state == closeLower) | (curr_state == closeAbove));
		 
		 
//		 if(~openner & (curr_state != correctState))
//		 guesses = guesses + 1;
//		 
//		 else
//		 guesses = guesses + 0;
		 
		 
		 //guesses = (~openner & (curr_state != correctState));
		 
		 end
		 
always_ff @ (posedge Clk)
		 begin
		
		 
		 if((~openner & (curr_state != correctState)) & (guessChecker[curr_state] == 0))
		 begin
		 guessesEasy <= guessesEasy + 1;
		 guessChecker[curr_state] <= 1; 
		 end
		 
		 if(reset)
		 begin
		 guessesEasy <= 0;
		 guessChecker<= 16'h0000;
		 end
		 
			
		 
		 end
assign guesses = guessesEasy;
				  							  
endmodule