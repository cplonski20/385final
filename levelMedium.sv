module  levelMedium ( input logic        levelMedStart, Clk, openner, 
							input logic [9:0] pickY,
                       output logic levelMedDone, output logic [3:0] HEXOUT);
							  
							  
							  
					
			myRandState generalKenobi(.Clk(Clk), .enable(levelMedStart), .myStateEasy(0), .myStateMedium(correctState), .myStateHard(0)); //considers max value as '30' and min value as
		
			//assign currLevel = 3'b001;
			logic found;
			
			logic [4:0] correctState;
			assign HEXOUT = correctState;
			//implement random generation as input to this module to generate correct state in future!!!!
			
			enum logic [4:0] {zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen
			, sixteen, seventeen, eighteen, nineteen, twenty, twentyone, twentytwo, twentythree, twentyfour, twentyfive, twentysix, twentyseven,
			twentyeight, twentynine, thirty, thirtyone}   curr_state; 
			//assign curr_state = one;

	//updates flip flop, current state is the only one
    
	 
	 always_ff @ (posedge Clk)
	 begin
          if(pickY >= 32 && pickY <= 46)
				 curr_state = zero;
			 else if(pickY >= 47 && pickY <= 60)
				 curr_state = one;
		    else if(pickY >= 61 && pickY <= 74)
				 curr_state = two;
			 else if(pickY >= 75 && pickY <= 88)
				 curr_state = three;
			 else if(pickY >= 89 && pickY <= 102)
				 curr_state = four;
			 else if(pickY >= 103 && pickY <= 116)
				 curr_state = five;
		    else if(pickY >= 117 && pickY <= 130)
				 curr_state = six;
			 else if(pickY >= 131 && pickY <= 144)
				 curr_state = seven;
			 else if(pickY >= 145 && pickY <= 158)
				 curr_state = eight;
			 else if(pickY >= 159 && pickY <= 172)
				 curr_state = nine;
			 else if(pickY >= 173 && pickY <= 186)
				 curr_state = ten;
			 else if(pickY >= 187 && pickY <= 200)
				 curr_state = eleven; 
			 else if(pickY >= 200 && pickY <= 214)
				 curr_state = twelve;
			 else if(pickY >= 215 && pickY <= 228)
				 curr_state = thirteen;
			 else if(pickY >= 229 && pickY <= 242)
				 curr_state = fourteen;
			 else if(pickY >= 243 && pickY <= 256)
				 curr_state = fifteen;
			 else if(pickY >= 257 && pickY <= 270)
				 curr_state = sixteen;
			 else if(pickY >= 271 && pickY <= 284)
				 curr_state = seventeen;
		    else if(pickY >= 285 && pickY <= 298)
				 curr_state = eighteen;
			 else if(pickY >= 299 && pickY <= 312)
				 curr_state = nineteen;
			 else if(pickY >= 313 && pickY <= 326)
				 curr_state = twenty;
			 else if(pickY >= 327 && pickY <= 340)
				 curr_state = twentyone;
		    else if(pickY >= 341 && pickY <= 354)
				 curr_state = twentytwo;
			 else if(pickY >= 355 && pickY <= 368)
				 curr_state = twentythree;
			 else if(pickY >= 369 && pickY <= 382)
				 curr_state = twentyfour;
			 else if(pickY >= 383 && pickY <= 396)
				 curr_state = twentyfive;
			 else if(pickY >= 397 && pickY <= 410)
				 curr_state = twentysix;
			 else if(pickY >= 411 && pickY <= 424)
				 curr_state = twentyseven; 
			 else if(pickY >= 425 && pickY <= 438)
				 curr_state = twentyeight;
			 else if(pickY >= 439 && pickY <= 452)
				 curr_state = twentynine;
			 else if(pickY >= 453 && pickY <= 466)
				 curr_state = thirty;
			 else if(pickY >= 467 && pickY <= 479)
				 curr_state = thirtyone;
end
		 
always_comb
		 begin
		 
		 levelMedDone = (curr_state == correctState) & ~openner;
		 
		 
	 end
				  							  
endmodule